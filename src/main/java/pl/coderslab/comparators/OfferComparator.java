package pl.coderslab.comparators;

import pl.coderslab.models.Offer;

import java.util.Comparator;

public class OfferComparator implements Comparator<Offer> {
    @Override
    public int compare(Offer o1, Offer o2) {
        return (-1)*o1.getCreated().compareTo(o2.getCreated());
    }
}
