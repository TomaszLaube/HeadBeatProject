package pl.coderslab.comparators;

import pl.coderslab.models.Ranking;

import java.util.Comparator;

public class RankingComparator implements Comparator<Ranking> {
    @Override
    public int compare(Ranking r1, Ranking r2) {
        return (-1)*r1.getOverallRating().compareTo(r2.getOverallRating());
    }
}
