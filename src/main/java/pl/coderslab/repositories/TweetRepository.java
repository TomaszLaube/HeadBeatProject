package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Tweet;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet,Long> {
    List<Tweet> findTweetsByUserId(Long userId);
    Tweet findTweetById(Long id);
    List<Tweet> findAllByHeadphoneIdOrderByCreatedDesc(Long headphoneId);
    Tweet findTweetByUserIdAndHeadphoneId(Long userId, Long HeadphoneId);
}
