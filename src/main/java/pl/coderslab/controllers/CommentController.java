package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.models.Comment;
import pl.coderslab.services.CommentService;

import javax.validation.Valid;

@Controller
@RequestMapping("/comments")
public class CommentController {
    @Autowired
    CommentService commentService;
    @PostMapping("/add")
    public String addComment(@ModelAttribute @Valid Comment newComment, BindingResult result){
        if(result.hasErrors()){
            return "redirect:/tweets/tweetDetails/" + newComment.getTweet().getId();
        }
        commentService.addComment(newComment);
        return "redirect:/tweets/tweetDetails/" + newComment.getTweet().getId();
    }
    @GetMapping("/edit/{commentId}")
    public String editComment(@PathVariable Long commentId, Model model){
        Comment comment = (Comment) commentService.findCommentById(commentId);
        model.addAttribute("comment",comment);
        return "commentViews/editComment";

    }
    @PostMapping("/edit")
    public String editedComment(@ModelAttribute @Valid Comment comment, BindingResult result){
        if(result.hasErrors()){
            return "commentViews/editComment";
        }
        commentService.editComment(comment);
        return "redirect:/tweets/tweetDetails/" + comment.getTweet().getId();
    }

}
