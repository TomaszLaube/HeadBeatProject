package pl.coderslab.services;

import java.util.List;

public interface HeadphoneService<H> {
    void addHeadphone(H h);
    List<H> findByNames(String manufacturer);
    H findById(Long id);
    List<H> findByUrl(String url);
    List<H> findByUrlLike(String url);

}
