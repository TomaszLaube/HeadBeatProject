package pl.coderslab.comparators;

import pl.coderslab.models.HeadphoneOwnership;

import java.util.Comparator;

public class OwnershipComparator implements Comparator<HeadphoneOwnership> {
    @Override
    public int compare(HeadphoneOwnership o1, HeadphoneOwnership o2) {
        return o1.getHeadphone().getFullName().compareTo(o2.getHeadphone().getFullName());
    }
}
