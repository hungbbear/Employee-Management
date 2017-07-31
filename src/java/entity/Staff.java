/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Hung
 */
@Entity
@Table(name="Staffs")
public class Staff {
    
    private int Id;
    private String Name;
    private boolean Gender;
    private String Birthday;
    private String Photo;
    private String Email;
    private String Phone;
    private long Salary;
    private String Note;
    private int DepartId;
    
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    public String getBirthday() {
        return Birthday;
    }

    public void setBirthday(String Birthday) {
        this.Birthday = Birthday;
    }

    public String getPhoto() {
        return Photo;
    }

    public void setPhoto(String Photo) {
        this.Photo = Photo;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public long getSalary() {
        return Salary;
    }

    public void setSalary(long Salary) {
        this.Salary = Salary;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public int getDepartId() {
        return DepartId;
    }

    public void setDepartId(int DepartId) {
        this.DepartId = DepartId;
    }
    
}
