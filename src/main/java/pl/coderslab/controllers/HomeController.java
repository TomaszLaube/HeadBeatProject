package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comparators.HeadphoneComparator;
import pl.coderslab.comparators.TweetComparator;
import pl.coderslab.models.Headphone;
import pl.coderslab.models.Offer;
import pl.coderslab.models.Tweet;
import pl.coderslab.models.User;
import pl.coderslab.services.HeadphoneService;
import pl.coderslab.services.OfferService;
import pl.coderslab.services.TweetService;
import pl.coderslab.services.UserService;
import pl.coderslab.util.BCrypt;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@SessionAttributes({"loggedUser"})
public class HomeController {
    @Autowired
    UserService userService;
    @Autowired
    TweetService tweetService;
    @Autowired
    OfferService offerService;
    @Autowired
    HeadphoneService headphoneService;

    @RequestMapping("/")
    public String init() {
        return "redirect:/welcomePage";
    }

    @RequestMapping("/welcomePage")
    public String homePage(HttpSession session) {
        if (session.getAttribute("loggedUser") != null) {
            return "redirect:/home";
        }
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String loginUser() {
        return "homeViews/login";
    }

    @PostMapping("/login")
    public String loggedUser(@RequestParam String username, @RequestParam String password, Model model) {
        User temp = (User) userService.findByUsername(username);
        if (temp != null && BCrypt.checkpw(password, temp.getPassword())) {
            model.addAttribute("loggedUser", temp);
            if (temp.getUsername().equals("admin")) {
                return "redirect:/admin";
            }
            return "redirect:/home";
        } else {
            model.addAttribute("notLogged", true);
            return "homeViews/login";
        }
    }

    @GetMapping("/register")
    public String registerUser(Model model) {
        model.addAttribute("user", new User());
        return "homeViews/registerForm";
    }

    @PostMapping("/register")
    public String registeredUser(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "homeViews/registerForm";
        }
        userService.addUser(user);
        return "redirect:/login";

    }

    @RequestMapping("/home")
    public String homeUser(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null) {
            User sessionUser = (User) session.getAttribute("loggedUser");
            User loggedUser = (User) userService.findUserById(sessionUser.getId());
            List<Tweet> tweets = tweetService.findAllByUserId(loggedUser.getId());
            List<User> observedUsers = loggedUser.getObservedUsers();
            List<Offer> newOffers = offerService.findAllByReceiverIdAndStatusId(loggedUser.getId(), 1L);
            for (User u : observedUsers) {
                List<Tweet> temp = tweetService.findAllByUserId(u.getId());
                tweets.addAll(temp);
            }
            Collections.sort(tweets, new TweetComparator());
            model.addAttribute("tweets", tweets);
            model.addAttribute("newOffers", newOffers);
            return "homeViews/homepage";
        }
        return "redirect:/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loggedUser");
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/admin")
    public String adminLog(HttpSession session, Model model) {
        User sessionUser = (User) session.getAttribute("loggedUser");
        if (sessionUser.getUsername().equals("admin")) {
            List<Headphone> newHeadphones = headphoneService.findByUrl(" ");
            Collections.sort(newHeadphones, new HeadphoneComparator());
            List<Headphone> remainingHeadphones = headphoneService.findByUrlLike("http");
            Collections.sort(remainingHeadphones, new HeadphoneComparator());
            model.addAttribute("newHeadphones", newHeadphones);
            model.addAttribute("remainingHeadphones",remainingHeadphones);

            return "homeViews/admin";
        }
        return "redirect:/home";

    }
    @GetMapping("/editData/{headphoneId}")
    public String addPicture(@PathVariable Long headphoneId, Model model){
        model.addAttribute("headphone", headphoneService.findById(headphoneId));
        return "homeViews/editData";
    }
    @PostMapping("/editData/{headphoneId}")
    public String addedPicture(@ModelAttribute @Valid Headphone headphone, BindingResult result){
        if(result.hasErrors()){
            return "homeViews/editData";
        }
        headphoneService.addHeadphone(headphone);
        return "redirect:/admin";
    }

}
