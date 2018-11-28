package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {
    User findUserById(Long id);
    User findUserByUsername(String username);
    List<User> findUsersByUsernameIgnoreCaseLike(String username);
    List<User> findUserByEmailIgnoreCase(String email);
    List<User> findUserByTelephone(String telephone);
    List<User> findUsersByLastNameIgnoreCaseLike(String lastName);
    List<User> findAllByOrderByUsernameAsc();
}
