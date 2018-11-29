package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.models.*;
import pl.coderslab.services.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/tweets")
public class TweetController {
    @Autowired
    TweetService tweetService;
    @Autowired
    OfferService offerService;
    @Autowired
    UserService userService;
    @Autowired
    RatingService ratingService;
    @Autowired
    CommentService commentService;
    @Autowired
    HeadphoneService headphoneService;


    @PostMapping("/addTweetReceiver/{offerId}")
    public String addReceiverTweet(@PathVariable Long offerId, HttpSession session, @RequestParam String review, @RequestParam Long rating){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        Offer offer = (Offer)offerService.findById(offerId);
        Headphone headphone = offer.getOffered();
        Rating newRating = new Rating();
        newRating.setValue(rating);
        newRating.setHeadphone(headphone);
        ratingService.addRating(newRating);
        Tweet newTweet = new Tweet();
        newTweet.setUser(loggedUser);
        newTweet.setHeadphone(headphone);
        newTweet.setOffer(offer);
        newTweet.setReview(review);
        newTweet.setRating(rating);
        tweetService.save(newTweet);
        return "redirect:/offers/offerBox";
    }
    @PostMapping("/addTweetSender/{offerId}")
    public String addSenderTweet(@PathVariable Long offerId, HttpSession session, @RequestParam String review, @RequestParam Long rating){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        Offer offer = (Offer)offerService.findById(offerId);
        Headphone headphone = offer.getRequested();
        Rating newRating = new Rating();
        newRating.setValue(rating);
        newRating.setHeadphone(headphone);
        ratingService.addRating(newRating);
        Tweet newTweet = new Tweet();
        newTweet.setUser(loggedUser);
        newTweet.setHeadphone(headphone);
        newTweet.setOffer(offer);
        newTweet.setReview(review);
        newTweet.setRating(rating);
        tweetService.save(newTweet);
        return "redirect:/offers/offerBox";
    }
    @PostMapping("/addTweetOwn/{headphoneId}")
    public String addOwnTweet(@PathVariable Long headphoneId, HttpSession session, @RequestParam String review, @RequestParam Long rating){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        Headphone headphone = (Headphone) headphoneService.findById(headphoneId);
        Rating newRating = new Rating();
        newRating.setValue(rating);
        newRating.setHeadphone(headphone);
        ratingService.addRating(newRating);
        Tweet newTweet = new Tweet();
        newTweet.setUser(loggedUser);
        newTweet.setHeadphone(headphone);
        newTweet.setReview(review);
        newTweet.setRating(rating);
        tweetService.save(newTweet);
        return "redirect:/headphones/headphone/" + headphoneId;
    }
    @RequestMapping("/tweetDetails/{tweetId}")
    public String seeTweet(@PathVariable Long tweetId, Model model, HttpSession session){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        Tweet tweet = (Tweet) tweetService.findById(tweetId);
        List<Comment> comments = commentService.findAllByTweetId(tweetId);
        model.addAttribute("tweet",tweet);
        model.addAttribute("comments",comments);
        model.addAttribute("newComment", new Comment());
        model.addAttribute("user",loggedUser);
        return "tweetViews/tweetDetails";
    }

}
