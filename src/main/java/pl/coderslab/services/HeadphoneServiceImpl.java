package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Headphone;
import pl.coderslab.repositories.HeadphoneRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class HeadphoneServiceImpl implements HeadphoneService<Headphone> {
    @Autowired
    HeadphoneRepository headphoneRepository;
    @Override
    public void addHeadphone(Headphone headphone) {
        headphoneRepository.save(headphone);
    }



    @Override
    public List<Headphone> findByNames(String manufacturer) {
        return headphoneRepository.findByManufacturerIgnoreCaseLike("%" + manufacturer + "%");
    }

    @Override
    public Headphone findById(Long id) {
        return headphoneRepository.findHeadphoneById(id);
    }

    @Override
    public List<Headphone> findByUrl(String url) {
        return headphoneRepository.findAllByUrl(url);
    }

    @Override
    public List<Headphone> findByUrlLike(String url) {
        return headphoneRepository.findAllByUrlLike("%" + url + "%");
    }
}
