package pl.coderslab.services;

import java.util.List;

public interface TweetService<T> {
    void save(T t);
    void update(T t);
    List<T> findAllByUserId(Long userId);
    T findById(Long id);
    List<T> findAllByHeadphoneId(Long headphoneId);
    T findByUserAndHeadphone(Long userId, Long headphoneId);

}
