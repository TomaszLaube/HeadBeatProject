package pl.coderslab.comparators;

import pl.coderslab.models.Headphone;

import java.util.Comparator;

public class HeadphoneComparator implements Comparator<Headphone> {
    @Override
    public int compare(Headphone h1, Headphone h2) {
        return h1.getFullName().compareTo(h2.getFullName());
    }
}
