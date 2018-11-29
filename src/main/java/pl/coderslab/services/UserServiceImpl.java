package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.User;
import pl.coderslab.repositories.UserRepository;
import pl.coderslab.util.BCrypt;

import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
public class UserServiceImpl implements UserService<User> {
    @Autowired
    UserRepository userRepository;

    @Override
    public void addUser(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
    }

    @Override
    public void editUser(User user) {
        userRepository.save(user);
    }

    @Override
    public User findUserById(Long id) {
        return userRepository.findUserById(id);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findUserByUsernameIgnoreCase(username);
    }

    @Override
    public List<User> findAllAlphabetically() {
        return userRepository.findAllByOrderByUsernameAsc();
    }

    @Override
    public List<User> findAllByUsername(String username) {
        return userRepository.findUsersByUsernameIgnoreCaseLike("%" + username + "%");
    }

    @Override
    public List<User> findUserByEmail(String email) {
        return userRepository.findUserByEmailIgnoreCase(email);
    }

    @Override
    public List<User> findUserByTelephone(String telephone) {
        return userRepository.findUserByTelephone(telephone);
    }

    @Override
    public List<User> findAllByLastName(String lastName) {
        return userRepository.findUsersByLastNameIgnoreCaseLike("%" + lastName + "%");
    }
}
