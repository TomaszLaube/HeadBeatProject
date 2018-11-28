package pl.coderslab.models;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.List;

@Entity
@Table(name = "ratings")
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Min(0)
    @Max(10)
    private float value;
    @ManyToOne
    private Headphone headphone;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public Headphone getHeadphone() {
        return headphone;
    }

    public void setHeadphone(Headphone headphone) {
        this.headphone = headphone;
    }
}
