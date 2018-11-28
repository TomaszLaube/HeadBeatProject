package pl.coderslab.validators;

import org.springframework.beans.factory.annotation.Autowired;
import pl.coderslab.models.User;
import pl.coderslab.repositories.UserRepository;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.List;

public class EmailValidator implements ConstraintValidator<UniqueEmail, String> {
    @Autowired
    UserRepository userRepository;

    @Override
    public void initialize(UniqueEmail uniqueEmail) {

    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        List<User> allUsers = userRepository.findAll();
        for(User u: allUsers){
            if(u.getEmail().toLowerCase().equals(s.toLowerCase())){
                return false;
            }
        }
        return true;
    }
}
