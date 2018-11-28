package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.HeadphoneOwnership;
import pl.coderslab.repositories.HeadphoneOwnershipRepository;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class HeadphoneOwnershipServiceImpl implements HeadPhoneOwnershipService<HeadphoneOwnership> {
    @Autowired
    HeadphoneOwnershipRepository headphoneOwnershipRepository;

    @Override
    public void addOwnership(HeadphoneOwnership o) {
        headphoneOwnershipRepository.save(o);
    }


    @Override
    public List<HeadphoneOwnership> findAllByUserId(Long userId) {
        return headphoneOwnershipRepository.findHeadphoneOwnershipsByUser_Id(userId);
    }

    @Override
    public List<HeadphoneOwnership> findAllByHeadphoneId(Long headphoneId) {
        return headphoneOwnershipRepository.findHeadphoneOwnershipsByHeadphone_Id(headphoneId);
    }

    @Override
    public List<HeadphoneOwnership> findAllByUserIdAndOwnership(Long userId, boolean owned) {
        return headphoneOwnershipRepository.findHeadphoneOwnershipsByUser_IdAndOwned(userId,owned);
    }

    @Override
    public List<HeadphoneOwnership> findAllByHeadphoneIdAndOwnership(Long headphoneId, boolean owned) {
        return headphoneOwnershipRepository.findHeadphoneOwnershipsByHeadphone_IdAndOwned(headphoneId, owned);
    }

    @Override
    public HeadphoneOwnership findByUserAndHeadphone(Long userId, Long headphoneId) {
        return headphoneOwnershipRepository.findByUserIdAndHeadphoneId(userId,headphoneId);
    }

    @Override
    public void deleteOwnership(HeadphoneOwnership o) {
        headphoneOwnershipRepository.delete(o);
    }


}
