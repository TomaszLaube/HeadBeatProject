package pl.coderslab.services;


import java.util.List;

public interface UserService<U> {
    void addUser(U u);
    void editUser (U u);
    U findUserById(Long id);
    U findByUsername(String username);
    List<U> findAllAlphabetically();
    List<U> findAllByUsername(String username);
    List<U> findUserByEmail(String email);
    List<U> findUserByTelephone(String telephone);
    List<U> findAllByLastName(String lastName);

}
