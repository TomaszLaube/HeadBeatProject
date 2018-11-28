package pl.coderslab.services;

public interface StatusService<S> {
    S findById(Long id);
}
