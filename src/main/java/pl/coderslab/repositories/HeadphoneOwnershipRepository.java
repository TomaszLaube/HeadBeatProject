package pl.coderslab.repositories;

import net.bytebuddy.description.modifier.Ownership;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.HeadphoneOwnership;

import java.util.List;

public interface HeadphoneOwnershipRepository extends JpaRepository<HeadphoneOwnership,Long> {
    List<HeadphoneOwnership> findHeadphoneOwnershipsByUser_Id(Long userId);
    List<HeadphoneOwnership> findHeadphoneOwnershipsByHeadphone_Id(Long headphoneId);
    List<HeadphoneOwnership> findHeadphoneOwnershipsByUser_IdAndOwned(Long userId, boolean owned);
    List<HeadphoneOwnership> findHeadphoneOwnershipsByHeadphone_IdAndOwned(Long headphoneId, boolean owned);
    HeadphoneOwnership findByUserIdAndHeadphoneId(Long userId, Long headphoneId);


}
