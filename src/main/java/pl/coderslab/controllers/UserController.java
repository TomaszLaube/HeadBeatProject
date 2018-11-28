package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comparators.OwnershipComparator;
import pl.coderslab.comparators.TweetComparator;
import pl.coderslab.models.HeadphoneOwnership;
import pl.coderslab.models.Tweet;
import pl.coderslab.models.User;
import pl.coderslab.services.HeadPhoneOwnershipService;
import pl.coderslab.services.TweetService;
import pl.coderslab.services.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loggedUser"})
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    HeadPhoneOwnershipService headPhoneOwnershipService;
    @Autowired
    TweetService tweetService;

    @RequestMapping("/account")
    public String account(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null) {
            User sessionUser = (User) session.getAttribute("loggedUser");
            User loggedUser = (User) userService.findUserById(sessionUser.getId());
            List<Tweet> userTweets = tweetService.findAllByUserId(loggedUser.getId());
            Collections.sort(userTweets,new TweetComparator());
            List<User> observedUsers = loggedUser.getObservedUsers();
            List<User> allUsers = userService.findAllByUsername("");
            List<User> observers = new ArrayList<>();
            for(User u: allUsers){
                List<User> temp = u.getObservedUsers();
                for(User u1: temp){
                    if(u1.getId()==loggedUser.getId()){
                        observers.add(u);
                        break;
                    }
                }
            }
            model.addAttribute("user", loggedUser);
            model.addAttribute("observedUsers", observedUsers);
            model.addAttribute("observers", observers);
            model.addAttribute("tweets",userTweets);
            return "userViews/accountInfo";
        }
        return "redirect:/login";
    }

    @GetMapping("/editAccount")
    public String updateAccount(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null) {
            User currentUser = (User) session.getAttribute("loggedUser");
            model.addAttribute("user", currentUser);
            return "userViews/updateAccount";
        }
        return "redirect:/login";
    }

    @PostMapping("/editAccount")
    public String updatedAccount(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "userViews/updateAccount";
        }
        User loggedUser = (User) userService.findUserById(user.getId());
        if (user.getPassword().equals(loggedUser.getPassword())) {
            userService.editUser(user);
        } else {
            userService.addUser(user);
        }
        return "redirect:/user/account";

    }

    @GetMapping("/{userId}")
    public String showUser(@PathVariable Long userId, Model model, HttpSession session) {
        User showedUser = (User) userService.findUserById(userId);
        List<HeadphoneOwnership> own = headPhoneOwnershipService.findAllByUserIdAndOwnership(showedUser.getId(), true);
        List<HeadphoneOwnership> loaned = headPhoneOwnershipService.findAllByUserIdAndOwnership(showedUser.getId(), false);
        List<Tweet> userTweets = tweetService.findAllByUserId(userId);
        Collections.sort(userTweets,new TweetComparator());
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<User> observedUsers = loggedUser.getObservedUsers();
        boolean followed = false;
        for (User u : observedUsers) {
            if (u.getId() == showedUser.getId()) {
                followed = true;
            }
        }
        if(loggedUser.getId()==showedUser.getId()){
            model.addAttribute("selfFollow", true);
        }
        List<User> observed = showedUser.getObservedUsers();
        List<User> allUsers = userService.findAllByUsername("");
        List<User> observers = new ArrayList<>();
        for(User u: allUsers){
            List<User> temp = u.getObservedUsers();
            for(User u1: temp){
                if(u1.getId()==userId){
                    observers.add(u);
                    break;
                }
            }
        }

        Collections.sort(own, new OwnershipComparator());
        Collections.sort(loaned, new OwnershipComparator());

        model.addAttribute("followed", followed);
        model.addAttribute("user", showedUser);
        model.addAttribute("ownCollection", own);
        model.addAttribute("loanedCollection", loaned);
        model.addAttribute("tweets", userTweets);
        model.addAttribute("observedUsers", observed);
        model.addAttribute("observers", observers);
        return "userViews/showUser";
    }

    @RequestMapping("/follow/{userId}")
    public String follow(@PathVariable Long userId, HttpSession session) {
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        User userToFollow = (User) userService.findUserById(userId);
        List<User> followed = loggedUser.getObservedUsers();
        followed.add(userToFollow);
        userService.editUser(loggedUser);

        return "redirect:../" + userId;
    }

    @RequestMapping("/unfollow/{userId}")
    public String unfollow(@PathVariable Long userId, HttpSession session) {
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<User> followed = loggedUser.getObservedUsers();
        Iterator<User> it = followed.iterator();
        while (it.hasNext()) {
            User temp = it.next();
            if (temp.getId() == userId) {
                it.remove();
            }
        }
        userService.editUser(loggedUser);


        return "redirect:../" + userId;
    }

    @GetMapping("/community")
    public String community(Model model, HttpSession session) {
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<User> allUsers = userService.findAllAlphabetically();
        allUsers = allUsers.stream()
                .filter(s -> !s.getUsername().equals("admin"))
                .filter(s -> s.getId()!=loggedUser.getId())
                .collect(Collectors.toList());
        model.addAttribute("allUsers", allUsers);
        return "userViews/userCommunity";
    }

    @PostMapping("/community")
    public String searchedCommunity(Model model, HttpSession session, @RequestParam String selector, @RequestParam String keyword) {
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<User> allUsers = userService.findAllAlphabetically();
        allUsers = allUsers.stream()
                .filter(s -> !s.getUsername().equals("admin"))
                .filter(s -> s.getId()!=loggedUser.getId())
                .collect(Collectors.toList());
        List<User> searchResults = new ArrayList<>();
        switch (selector) {
            case "username":
                searchResults = userService.findAllByUsername(keyword);
                searchResults = searchResults.stream()
                        .filter(s -> !s.getUsername().equals("admin"))
                        .filter(s -> s.getId()!=loggedUser.getId())
                        .collect(Collectors.toList());
                model.addAttribute("searchResults", searchResults);
                break;
            case "email":
                searchResults = userService.findUserByEmail(keyword);
                searchResults = searchResults.stream()
                        .filter(s -> !s.getUsername().equals("admin"))
                        .filter(s -> s.getId()!=loggedUser.getId())
                        .collect(Collectors.toList());
                model.addAttribute("searchResults", searchResults);
                break;
            case "lastName":
                searchResults = userService.findAllByLastName(keyword);
                searchResults = searchResults.stream()
                        .filter(s -> !s.getUsername().equals("admin"))
                        .filter(s -> s.getId()!=loggedUser.getId())
                        .collect(Collectors.toList());
                model.addAttribute("searchResults", searchResults);
                break;
            case "telephone":
                searchResults = userService.findUserByTelephone(keyword);
                searchResults = searchResults.stream()
                        .filter(s -> !s.getUsername().equals("admin"))
                        .filter(s -> s.getId()!=loggedUser.getId())
                        .collect(Collectors.toList());
                model.addAttribute("searchResults", searchResults);
                break;
            default:
                model.addAttribute("searchResults", null);

        }
        model.addAttribute("searchInit",true);
        model.addAttribute("allUsers", allUsers);
        return "userViews/userCommunity";
    }

}
