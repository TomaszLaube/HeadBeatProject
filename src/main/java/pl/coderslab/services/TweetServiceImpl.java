package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Tweet;
import pl.coderslab.repositories.TweetRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class TweetServiceImpl implements TweetService<Tweet> {
    @Autowired
    TweetRepository tweetRepository;

    @Override
    public void save(Tweet tweet) {
        tweet.setCreated(new Timestamp(new Date().getTime()));
        tweetRepository.save(tweet);
    }

    @Override
    public void update(Tweet tweet) {
        tweetRepository.save(tweet);
    }

    @Override
    public List<Tweet> findAllByUserId(Long userId) {
        return tweetRepository.findTweetsByUserId(userId);
    }

    @Override
    public Tweet findById(Long id) {
        return tweetRepository.findTweetById(id);
    }

    @Override
    public List<Tweet> findAllByHeadphoneId(Long headphoneId) {
        return tweetRepository.findAllByHeadphoneIdOrderByCreatedDesc(headphoneId);
    }

    @Override
    public Tweet findByUserAndHeadphone(Long userId, Long headphoneId) {
        return tweetRepository.findTweetByUserIdAndHeadphoneId(userId,headphoneId);
    }


}
