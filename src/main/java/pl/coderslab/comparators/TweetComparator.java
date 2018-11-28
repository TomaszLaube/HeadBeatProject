package pl.coderslab.comparators;

import pl.coderslab.models.Tweet;

import java.util.Comparator;

public class TweetComparator implements Comparator<Tweet> {
    @Override
    public int compare(Tweet t1, Tweet t2) {
        return t1.getCreated().compareTo(t2.getCreated())*(-1);
    }
}
