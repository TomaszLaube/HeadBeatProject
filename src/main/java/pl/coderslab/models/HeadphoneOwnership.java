package pl.coderslab.models;

import javax.persistence.*;

@Entity
@Table(name = "ownerships")
public class HeadphoneOwnership {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private boolean owned;

    @ManyToOne
    private User user;
    @ManyToOne
    private Headphone headphone;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isOwned() {
        return owned;
    }

    public void setOwned(boolean owned) {
        this.owned = owned;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Headphone getHeadphone() {
        return headphone;
    }

    public void setHeadphone(Headphone headphone) {
        this.headphone = headphone;
    }
}
