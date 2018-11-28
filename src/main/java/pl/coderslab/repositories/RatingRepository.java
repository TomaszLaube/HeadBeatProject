package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Rating;

import java.util.List;

public interface RatingRepository extends JpaRepository<Rating,Long> {
    List<Rating> findRatingsByHeadphoneId(Long headphoneId);
}
