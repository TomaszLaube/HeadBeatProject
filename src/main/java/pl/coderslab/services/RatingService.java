package pl.coderslab.services;

import java.util.List;

public interface RatingService<R> {
    void addRating(R r);
    List<R> findAllByHeadphoneId(Long headphoneId);

}
