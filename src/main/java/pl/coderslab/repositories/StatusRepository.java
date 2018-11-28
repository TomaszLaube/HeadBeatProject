package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Status;

public interface StatusRepository extends JpaRepository<Status,Long> {
    Status findStatusById(Long id);
}
