package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Status;
import pl.coderslab.repositories.StatusRepository;

import javax.transaction.Transactional;

@Service
@Transactional
public class StatusServiceImpl implements StatusService<Status> {
    @Autowired
    StatusRepository statusRepository;
    @Override
    public Status findById(Long id) {
        return statusRepository.findStatusById(id);
    }
}
