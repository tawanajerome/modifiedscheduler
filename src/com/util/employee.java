package com.util;

public class employee {

    int SSN;
    String firstname;
    String lastname;
    int jid;
    int wage;
    String phone;
    String email;
    int lid;

    public void setfirstname(String x)
    {this.firstname = x;}

    public void setlastname(String x)
    {this.lastname = x;}

    public void setjid(int x)
    {this.jid= x;}

    public void setssn(int SSN) {
        this.SSN = SSN; }
    public void setwage(int wage)
    {this.wage = wage;}

    public void setemail(String email) {
        this.email = email;
    }

    public void setphone(String phone) {
        this.phone = phone;
    }

    public void setlid(int lid) {
        this.lid = lid;
    }

    public String getemail() {
        return email;
    }

    public String getfirstname() {
        return firstname;
    }

    public int getssn() {
        return SSN;
    }

    public int getjid() {
        return jid;
    }

    public int getlid() {
        return lid;
    }
    public int getwage() {
        return wage;
    }
    public String getlastname()
    {return lastname;}
    public String getphone()
    {return phone;}

}