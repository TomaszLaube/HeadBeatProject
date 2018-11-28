package pl.coderslab.services;

import java.util.List;

public interface CommentService<C> {
    void addComment(C c);
    void editComment(C c);
    C findCommentById(Long id);
    List<C> findAllByTweetId(Long tweetId);

}
