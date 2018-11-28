package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Comment;
import pl.coderslab.repositories.CommentRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class CommentServiceImpl implements CommentService<Comment> {
    @Autowired
    CommentRepository commentRepository;
    @Override
    public void addComment(Comment comment) {
        comment.setCreated(new Timestamp(new Date().getTime()));
        commentRepository.save(comment);
    }

    @Override
    public void editComment(Comment comment) {
        commentRepository.save(comment);
    }

    @Override
    public Comment findCommentById(Long id) {
        return commentRepository.findCommentById(id);
    }

    @Override
    public List<Comment> findAllByTweetId(Long tweetId) {
        return commentRepository.findAllByTweetIdOrderByCreatedDesc(tweetId);
    }
}
