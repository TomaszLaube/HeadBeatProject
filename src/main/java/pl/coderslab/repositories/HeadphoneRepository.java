package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Headphone;

import java.util.List;

public interface HeadphoneRepository extends JpaRepository<Headphone,Long> {
    List<Headphone> findByManufacturerIgnoreCaseLike(String manufacturer);
    Headphone findHeadphoneById(Long id);
    List<Headphone> findAllByUrl(String url);
    List<Headphone> findAllByUrlLike(String url);

}
