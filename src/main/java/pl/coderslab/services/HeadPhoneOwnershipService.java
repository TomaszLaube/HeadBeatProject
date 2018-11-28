package pl.coderslab.services;

import java.util.List;

public interface HeadPhoneOwnershipService<O> {
    void addOwnership(O o);
    List<O> findAllByUserId(Long userId);
    List<O> findAllByHeadphoneId(Long headphoneId);
    List<O> findAllByUserIdAndOwnership(Long userId, boolean owned);
    List<O> findAllByHeadphoneIdAndOwnership(Long headphoneId, boolean owned);
    O findByUserAndHeadphone(Long userId, Long headphoneId);
    void deleteOwnership(O o);

}
