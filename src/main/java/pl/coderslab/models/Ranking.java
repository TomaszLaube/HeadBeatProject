package pl.coderslab.models;

public class Ranking {
    private Float overallRating;
    private Headphone headphone;

    public Ranking(float overallRating, Headphone headphone) {
        this.overallRating = overallRating;
        this.headphone = headphone;
    }

    public Float getOverallRating() {
        return overallRating;
    }

    public void setOverallRating(Float overallRating) {
        this.overallRating = overallRating;
    }

    public Headphone getHeadphone() {
        return headphone;
    }

    public void setHeadphone(Headphone headphone) {
        this.headphone = headphone;
    }
}
