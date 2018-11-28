package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Offer;
import pl.coderslab.repositories.OfferRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class OfferServiceImpl implements OfferService<Offer> {
    @Autowired
    OfferRepository offerRepository;

    @Override
    public void add(Offer o) {
       o.setCreated(new Timestamp(new Date().getTime()));
        offerRepository.save(o);
    }

    @Override
    public void update(Offer o) {
        add(o);
    }

    @Override
    public Offer findById(Long id) {
        return offerRepository.findOfferById(id);
    }

    @Override
    public List<Offer> findAllBySenderId(Long senderId) {
        return offerRepository.findOffersBySenderId(senderId);
    }

    @Override
    public List<Offer> findAllBySenderIdAndStatusId(Long senderId, Long statusId) {
        return offerRepository.findOffersBySenderIdAndStatusId(senderId,statusId);
    }

    @Override
    public List<Offer> findAllByReceiverId(Long receiverId) {
        return offerRepository.findOffersByReceiverId(receiverId);
    }

    @Override
    public List<Offer> findAllByReceiverIdAndStatusId(Long receiverId, Long statusId) {
        return offerRepository.findOffersByReceiverIdAndStatusId(receiverId,statusId);
    }

    @Override
    public List<Offer> findAllByReceiverSenderStatus(Long receiverId, Long senderId, Long statusId) {
        return offerRepository.findOffersByReceiverIdAndSenderIdAndStatusId(receiverId,senderId,statusId);
    }
}
