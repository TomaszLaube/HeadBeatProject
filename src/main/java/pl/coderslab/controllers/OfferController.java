package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comparators.OfferComparator;
import pl.coderslab.addins.MailSender;
import pl.coderslab.models.*;
import pl.coderslab.services.*;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/offers")
public class OfferController {
    @Autowired
    OfferService offerService;
    @Autowired
    UserService userService;
    @Autowired
    HeadPhoneOwnershipService headPhoneOwnershipService;
    @Autowired
    HeadphoneService headphoneService;
    @Autowired
    StatusService statusService;
    @Autowired
    TweetService tweetService;

    @RequestMapping("/offerBox")
    public String offerBox(HttpSession session, Model model){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<Offer> inbox = offerService.findAllByReceiverId(loggedUser.getId());
        List<Offer> outbox = offerService.findAllBySenderId(loggedUser.getId());
        Collections.sort(inbox,new OfferComparator());
        Collections.sort(outbox, new OfferComparator());

        model.addAttribute("inbox", inbox);
        model.addAttribute("outbox", outbox);
        return "offerViews/offerBox";
    }
    @RequestMapping("/chooseUser")
    public String chooseUser(HttpSession session, Model model){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        List<User> followed = loggedUser.getObservedUsers();

        model.addAttribute("followed", followed);
        return "offerViews/chooseUser";
    }
    @GetMapping("/createOffer/{userId}")
    public String addOfferForm(@PathVariable Long userId, HttpSession session, Model model){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        User receiver = (User)userService.findUserById(userId);
        List<HeadphoneOwnership> ownOwnerships = headPhoneOwnershipService.findAllByUserIdAndOwnership(loggedUser.getId(),true);
        List<HeadphoneOwnership> userOwnerships = headPhoneOwnershipService.findAllByUserIdAndOwnership(userId,true);
        List<Offer> sentOwnHeadphones = offerService.findAllBySenderIdAndStatusId(loggedUser.getId(), 2L);
        List<Offer> receivedOwnHeadphones = offerService.findAllByReceiverIdAndStatusId(loggedUser.getId(),2L);
        Iterator<HeadphoneOwnership> it1 = ownOwnerships.iterator();
        while(it1.hasNext()){
            HeadphoneOwnership temp = it1.next();
            for(int i=0; i<sentOwnHeadphones.size(); i++){
                Offer tempO = sentOwnHeadphones.get(i);
                if(temp.getHeadphone().getId()==tempO.getOffered().getId()){
                    it1.remove();
                    break;
                }
            }
            for(int i=0; i<receivedOwnHeadphones.size(); i++){
                Offer temp1 = receivedOwnHeadphones.get(i);
                if(temp.getHeadphone().getId()==temp1.getRequested().getId()){
                    it1.remove();
                    break;
                }
            }
        }
        List<Offer> sentUserHeadphones = offerService.findAllBySenderIdAndStatusId(userId, 2L);
        List<Offer> receivedUserHeadphones = offerService.findAllByReceiverIdAndStatusId(userId,2L);
        Iterator<HeadphoneOwnership> it2 = userOwnerships.iterator();
        while(it2.hasNext()){
            HeadphoneOwnership temp = it2.next();
            for(int i=0; i<sentUserHeadphones.size(); i++){
                Offer tempO = sentUserHeadphones.get(i);
                if(temp.getHeadphone().getId()==tempO.getOffered().getId()){
                    it2.remove();
                    break;
                }
            }
            for(int i=0; i<receivedUserHeadphones.size(); i++){
                Offer temp1 = receivedUserHeadphones.get(i);
                if(temp.getHeadphone().getId()==temp1.getRequested().getId()){
                    it2.remove();
                    break;
                }
            }
        }
        List<HeadphoneOwnership> ownCollection = headPhoneOwnershipService.findAllByUserId(loggedUser.getId());
        List<HeadphoneOwnership> userCollection = headPhoneOwnershipService.findAllByUserId(userId);
        Iterator<HeadphoneOwnership> itFinalOwn = ownOwnerships.iterator();
        Iterator<HeadphoneOwnership> itFinalUser = userOwnerships.iterator();

        while (itFinalOwn.hasNext()){
            HeadphoneOwnership temp = itFinalOwn.next();
            for(HeadphoneOwnership h: userCollection){
                if(temp.getHeadphone().getId()==h.getHeadphone().getId()){
                    itFinalOwn.remove();
                }
            }
        }
        while (itFinalUser.hasNext()){
            HeadphoneOwnership temp = itFinalUser.next();
            for(HeadphoneOwnership h: ownCollection){
                if(temp.getHeadphone().getId()==h.getHeadphone().getId()){
                    itFinalUser.remove();
                }
            }
        }
        model.addAttribute("receiver", receiver);
        model.addAttribute("ownOwnerships",ownOwnerships);
        model.addAttribute("userOwnerships", userOwnerships);
        return "offerViews/offerForm";
    }
    @PostMapping("/createOffer/{userId}")
    public String sendOffer(@PathVariable Long userId, HttpSession session, Model model, @RequestParam Long offered, @RequestParam Long requested){
        User sessionUser = (User) session.getAttribute("loggedUser");
        User loggedUser = (User) userService.findUserById(sessionUser.getId());
        User receiver = (User)userService.findUserById(userId);

        Offer newOffer = new Offer();
        newOffer.setSender(loggedUser);
        newOffer.setReceiver(receiver);
        newOffer.setOffered((Headphone) headphoneService.findById(offered));
        newOffer.setRequested((Headphone)headphoneService.findById(requested));
        newOffer.setStatus((Status) statusService.findById(1L));
        offerService.add(newOffer);
        try{
            MailSender.sendOffer(loggedUser.getUsername(), newOffer.getOffered().getFullName(), newOffer.getRequested().getFullName(), "http://localhost:8080/offers/offerDetailsInbox/" + newOffer.getId());
        } catch (AddressException e){
            e.printStackTrace();
        } catch (MessagingException e){
            e.printStackTrace();
        }
        return "redirect:../offerBox";
    }

    @RequestMapping("/offerDetailsInbox/{offerId}")
    public String offerDetailsIn(@PathVariable Long offerId, Model model){
        Offer offer = (Offer) offerService.findById(offerId);
        Tweet review = (Tweet) tweetService.findByUserAndHeadphone(offer.getReceiver().getId(),offer.getOffered().getId());
        model.addAttribute("tweet",review);
        model.addAttribute("offer",offer);
        model.addAttribute("responsive",true);
        return "offerViews/offerDetails";
    }
    @RequestMapping("/offerDetailsOutbox/{offerId}")
    public String offerDetailsOut(@PathVariable Long offerId, Model model){
        Offer offer = (Offer) offerService.findById(offerId);
        Tweet review = (Tweet) tweetService.findByUserAndHeadphone(offer.getSender().getId(),offer.getRequested().getId());
        model.addAttribute("tweet",review);
        model.addAttribute("offer",offer);
        model.addAttribute("responsive",false);
        return "offerViews/offerDetails";
    }
    @RequestMapping("/acceptOffer/{offerId}")
    public String acceptOffer(@PathVariable Long offerId){
        Offer offer = (Offer) offerService.findById(offerId);
        offer.setStatus((Status) statusService.findById(2L));
        offerService.update(offer);
        return "redirect:../offerBox";
    }
    @RequestMapping("/declineOffer/{offerId}")
    public String declineOffer(@PathVariable Long offerId){
        Offer offer = (Offer) offerService.findById(offerId);
        offer.setStatus((Status) statusService.findById(3L));
        offerService.update(offer);
        return "redirect:../offerBox";
    }
    @RequestMapping("/endLoan/{offerId}")
    public String endLoan(@PathVariable Long offerId){
        Offer offer = (Offer) offerService.findById(offerId);
        offer.setStatus((Status) statusService.findById(4L));
        offerService.update(offer);

        HeadphoneOwnership senderOwnership = new HeadphoneOwnership();
        senderOwnership.setUser(offer.getSender());
        senderOwnership.setHeadphone(offer.getRequested());
        senderOwnership.setOwned(false);
        headPhoneOwnershipService.addOwnership(senderOwnership);

        HeadphoneOwnership receiverOwnership = new HeadphoneOwnership();
        receiverOwnership.setUser(offer.getReceiver());
        receiverOwnership.setHeadphone(offer.getOffered());
        receiverOwnership.setOwned(false);
        headPhoneOwnershipService.addOwnership(receiverOwnership);

        return "redirect:../offerBox";
    }
}
