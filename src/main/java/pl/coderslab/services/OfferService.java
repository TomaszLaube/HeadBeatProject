package pl.coderslab.services;

import java.util.List;

public interface OfferService<O> {
    void add(O o);
    void update(O o);
    O findById(Long id);
    List<O> findAllBySenderId(Long senderId);
    List<O> findAllBySenderIdAndStatusId(Long senderId, Long statusId);
    List<O> findAllByReceiverId(Long receiverId);
    List<O> findAllByReceiverIdAndStatusId(Long receiverId, Long statusId);
    List<O> findAllByReceiverSenderStatus(Long receiverId, Long senderId, Long statusId);

}
