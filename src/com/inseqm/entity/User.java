package com.inseqm.entity;

import java.util.Date;

public class User {

    private int id;
    private String username;
    private String password;
    private String sex;
    private Date birthday;
    private String qq;
    private String mobile;
    private String email;
    private Date create_time;
    private String head_portrait;

    public User(){ }

    public User( String username, String password, String sex, Date birthday, String qq, String mobile, String email, Date create_time, String head_portrait) {
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.birthday = birthday;
        this.qq = qq;
        this.mobile = mobile;
        this.email = email;
        this.create_time = create_time;
        this.head_portrait = head_portrait;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getHead_portrait() {
        return head_portrait;
    }

    public void setHead_portrait(String head_portrait) {
        this.head_portrait = head_portrait;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", qq='" + qq + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", create_time=" + create_time +
                ", head_portrait='" + head_portrait + '\'' +
                '}';
    }

/*public static void main(String[] args) {
        User u = new User();
        System.out.println(u);
    }*/
}
