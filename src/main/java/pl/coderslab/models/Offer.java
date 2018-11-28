package pl.coderslab.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Entity
@Table(name = "offers")
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @ManyToOne
    @NotNull
    private User sender;

    @ManyToOne
    @NotNull
    private User receiver;

    @ManyToOne
    private Headphone offered;

    @ManyToOne
    private Headphone requested;

    private Timestamp created;

    @ManyToOne
    @NotNull
    private Status status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }

    public Headphone getOffered() {
        return offered;
    }

    public void setOffered(Headphone offered) {
        this.offered = offered;
    }

    public Headphone getRequested() {
        return requested;
    }

    public void setRequested(Headphone requested) {
        this.requested = requested;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
