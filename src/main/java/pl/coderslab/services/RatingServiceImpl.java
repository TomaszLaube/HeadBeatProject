package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Rating;
import pl.coderslab.repositories.RatingRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class RatingServiceImpl implements RatingService<Rating> {
    @Autowired
    RatingRepository ratingRepository;

    @Override
    public void addRating(Rating rating) {
        ratingRepository.save(rating);
    }

    @Override
    public List<Rating> findAllByHeadphoneId(Long headphoneId) {
        return ratingRepository.findRatingsByHeadphoneId(headphoneId);
    }
}
