package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Offer;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer,Long> {
    Offer findOfferById(Long id);
    List<Offer> findOffersByReceiverId(Long id);
    List<Offer> findOffersBySenderId(Long id);
    List<Offer> findOffersByReceiverIdAndStatusId(Long receiverId, Long statusId);
    List<Offer> findOffersBySenderIdAndStatusId(Long senderId, Long statusId);
    List<Offer> findOffersByReceiverIdAndSenderIdAndStatusId(Long receiverId, Long senderId, Long statusId);

}
