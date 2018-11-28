package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Long> {
    Comment findCommentById(Long id);
    List<Comment> findAllByTweetIdOrderByCreatedDesc(Long tweetId);
}
