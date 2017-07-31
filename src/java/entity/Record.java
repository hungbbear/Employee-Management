/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Hung
 */
@Entity
@Table(name="Records")
public class Record {
    private int Id;
    private boolean Type;
    private String Reason;
    private String Time;
    private int StaffId;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public boolean isType() {
        return Type;
    }

    public void setType(boolean Type) {
        this.Type = Type;
    }

    public String getReason() {
        return Reason;
    }

    public void setReason(String Reason) {
        this.Reason = Reason;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }



    public int getStaffId() {
        return StaffId;
    }

    public void setStaffId(int StaffId) {
        this.StaffId = StaffId;
    }
    
    
}
