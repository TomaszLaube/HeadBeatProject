package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.addins.PicSearch;
import pl.coderslab.comparators.HeadphoneComparator;
import pl.coderslab.comparators.RankingComparator;
import pl.coderslab.models.*;
import pl.coderslab.services.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/headphones")
@SessionAttributes({"loggedUser"})
public class HeadphoneController {
    @Autowired
    HeadphoneService headphoneService;
    @Autowired
    UserService userService;
    @Autowired
    HeadPhoneOwnershipService headPhoneOwnershipService;
    @Autowired
    RatingService ratingService;
    @Autowired
    TweetService tweetService;

    @RequestMapping("/collection")
    public String userCollection(Model model, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        List<Tweet> userTweets = tweetService.findAllByUserId(loggedUser.getId());
        List<HeadphoneOwnership> own = headPhoneOwnershipService.findAllByUserIdAndOwnership(loggedUser.getId(), true);
        List<HeadphoneOwnership> loaned = headPhoneOwnershipService.findAllByUserIdAndOwnership(loggedUser.getId(), false);
        List<Headphone> ownCollection = new ArrayList<>();
        List<Headphone> loanedCollection = new ArrayList<>();
        for (HeadphoneOwnership o : own) {
            ownCollection.add(o.getHeadphone());
        }
        for (HeadphoneOwnership l : loaned) {
            loanedCollection.add(l.getHeadphone());
        }
        Collections.sort(ownCollection, new HeadphoneComparator());
        Collections.sort(loanedCollection, new HeadphoneComparator());
        model.addAttribute("ownHeadphones", ownCollection);
        model.addAttribute("loanedHeadphones", loanedCollection);
        model.addAttribute("userTweets",userTweets);
        return "headphoneViews/userCollection";

    }

    @GetMapping("/add")
    public String addHeadphone(Model model) {
        model.addAttribute("newHeadphone", new Headphone());
        return "headphoneViews/addForm";
    }

    @PostMapping("/add")
    public String addedHeadphone(@ModelAttribute @Valid Headphone newHeadphone, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "headphoneViews/addForm";
        }
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<Headphone> searchedHeadphones = headphoneService.findByNames(newHeadphone.getManufacturer());

        List<HeadphoneOwnership> own = headPhoneOwnershipService.findAllByUserIdAndOwnership(loggedUser.getId(), true);
        List<Headphone> ownCollection = new ArrayList<>();
        for (HeadphoneOwnership o : own) {
            ownCollection.add(o.getHeadphone());
        }

        List<Headphone> proposedHeadphones = new ArrayList<>();
        Iterator<Headphone> it = searchedHeadphones.iterator();
        while (it.hasNext()) {
            Headphone temp = it.next();
            boolean checker = true;
            for (Headphone h : ownCollection) {
                if (h.getId() == temp.getId()) {
                    checker = false;
                }
            }
            if (checker) {
                proposedHeadphones.add(temp);
            }
        }
        model.addAttribute("proposedHeadphones", proposedHeadphones);
        return "headphoneViews/addPropositions";
    }

    @RequestMapping("/assign/{headphoneId}")
    public String addToDB(@PathVariable Long headphoneId, HttpSession session) {
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());

        List<HeadphoneOwnership> loaned = headPhoneOwnershipService.findAllByUserIdAndOwnership(loggedUser.getId(), false);
        for (HeadphoneOwnership l : loaned) {
            if (l.getHeadphone().getId() == headphoneId) {
                l.setOwned(true);
                headPhoneOwnershipService.addOwnership(l);
                return "redirect:/headphones/collection";
            }
        }
        HeadphoneOwnership newOwnership = new HeadphoneOwnership();
        newOwnership.setOwned(true);
        newOwnership.setUser(loggedUser);
        newOwnership.setHeadphone((Headphone) headphoneService.findById(headphoneId));
        headPhoneOwnershipService.addOwnership(newOwnership);
        return "redirect:/headphones/collection";
    }

    @GetMapping("/addNew")
    public String addNewModel(Model model) {
        model.addAttribute("newHeadphone", new Headphone());
        return "headphoneViews/addNewForm";
    }

    @PostMapping("/addNew")
    public String addedNew(@ModelAttribute @Valid Headphone newHeadphone, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "headphoneViews/addNewForm";
        }
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
      //  newHeadphone.setUrl(PicSearch.getPictureUrl(newHeadphone.getFullName()));
        headphoneService.addHeadphone(newHeadphone);

        HeadphoneOwnership newOwnership = new HeadphoneOwnership();
        newOwnership.setUser(loggedUser);
        newOwnership.setHeadphone(newHeadphone);
        newOwnership.setOwned(true);
        headPhoneOwnershipService.addOwnership(newOwnership);
        return "redirect:/headphones/collection";
    }

    @RequestMapping("/ranking")
    public String ranking(Model model) {
        List<Headphone> allHeadphones = headphoneService.findByNames("");
        List<Ranking> rankings = new ArrayList<>();
        List<Headphone> unranked = new ArrayList<>();
        for (Headphone h : allHeadphones) {
            float ratings = 0;
            float count = 0;
            List<Rating> headphoneRatings = ratingService.findAllByHeadphoneId(h.getId());
            for (Rating r : headphoneRatings) {
                ratings += r.getValue();
                count++;
            }
            if (count == 0) {
                unranked.add(h);
            } else {
                float avg = ratings / count;
                Ranking ranking = new Ranking(avg, h);
                rankings.add(ranking);
            }
        }
        Collections.sort(rankings, new RankingComparator());
        model.addAttribute("rankings", rankings);
        model.addAttribute("unrankedHeadphones", unranked);
        return "headphoneViews/ranking";
    }

    @RequestMapping("/headphone/{headphoneId}")
    public String showHeadphone(Model model, @PathVariable Long headphoneId, HttpSession session) {
        Headphone headphone = (Headphone) headphoneService.findById(headphoneId);
        float ratings = 0;
        float count = 0;
        List<Rating> headphoneRatings = ratingService.findAllByHeadphoneId(headphone.getId());
        for (Rating r : headphoneRatings) {
            ratings += r.getValue();
            count++;
        }
        float avg = 0;
        if (count != 0) {
            avg = ratings / count;
        }
        Ranking ranking = new Ranking(avg, headphone);
        model.addAttribute("ranking",ranking);
        model.addAttribute("tweets", tweetService.findAllByHeadphoneId(headphoneId));
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<HeadphoneOwnership> userCollection = headPhoneOwnershipService.findAllByUserId(loggedUser.getId());
        boolean inCollection = false;
        for(HeadphoneOwnership o: userCollection){
            if(o.getHeadphone().getId()==headphoneId){
                inCollection = true;
                break;
            }
        }
        Tweet userTweet = (Tweet) tweetService.findByUserAndHeadphone(loggedUser.getId(),headphoneId);
        boolean toReview = false;
        if(inCollection && userTweet==null){
            toReview=true;
        }
        model.addAttribute("toReview",toReview);

        return "headphoneViews/headphoneDetails";
    }
    @RequestMapping("/moveToPersonal/{headphoneId}")
    public String toPersonal(@PathVariable Long headphoneId, HttpSession session){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        HeadphoneOwnership toChange = (HeadphoneOwnership) headPhoneOwnershipService.findByUserAndHeadphone(loggedUser.getId(),headphoneId);
        toChange.setOwned(true);
        headPhoneOwnershipService.addOwnership(toChange);
        return"redirect:../collection";
    }
    @RequestMapping("/removeOwnership/{headphoneId}")
    public String removeOwnership(@PathVariable Long headphoneId, HttpSession session){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        HeadphoneOwnership toDelete = (HeadphoneOwnership) headPhoneOwnershipService.findByUserAndHeadphone(loggedUser.getId(),headphoneId);
        toDelete.setOwned(false);
        headPhoneOwnershipService.addOwnership(toDelete);
        return"redirect:../collection";
    }


}
