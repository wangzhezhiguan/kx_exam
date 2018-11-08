package com.kx.exam.model;


import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Table(name = "xt_userinfo")
public class Userinfo {
	@Id
    @GeneratedValue(generator="UUID")
    private String userid;

    private String loginname;
    private String customerid;
    

    private String mobile;

    private String password;
    private String belongto;//手机归属地
    private String opuserid;
    @Transient
    private Oper_user oper_user;

    private String uname;

    private String nickname;

    private String compname;
    private String compaddress;//位单地址
    private String comptel;//单位电话
    private String income;//月收入
    private String areaid;

    private String usertype;

    private String sex;

    private String tel;
    private String qq;
    private String weixin;
    private String email;
    private String address;
    private String gpsaddress;
    private String post;
    private String birthday;
    private String headpic;
    private String status;//0:审核中;1:已通过;2:业务员维护中;3:拒绝申请;4:失征信;5:已弃用;6:停用;7:已删除;
    private Double balance;
	private String ifmarriage;//婚姻情况  已婚、未婚	
	private String education;//历学 小学、初中、高中/中专、大专、本科、研究生以上
    private String cardid;
    private Integer creditfen;
    private String lastlogindate;
    private Integer logins;
    private String pwderrordate;
    private Integer pwderrorlogins;
    private Double latitude;
    private Double longitude;
    private String fromapp;
    private String fromchannel;
    private String remark;
    private String createdate;
    private String ifbasic;//基本是否认证  0需要上传，1已上传
    private String ifid;//身份证是否认证  0需要上传，1已上传
    private String ifcontacts;//联系人是否认证  0需要上传，1已上传
    private String ifcarrier;//营运商是否认证  0需要上传，1已上传
    private String ifvideo;//视频是否认证  0需要上传，1已上传
    private String ifother;//其他是否认证  0需要上传，1已上传
    private String ifrenzheng;//是否认证通过 0需要认证，1认证中，2认证通过，3需要重新认证
    
    //
    @Transient
    private String ifoper;//是否后台管理员 0非系统管理员，1为系统管理员
    @Transient
    private String compid;
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }


    public String getLoginname() {
        return loginname;
    }


    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }


    public String getMobile() {
        return mobile;
    }


    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getCompname() {
        return compname;
    }

    public void setCompname(String compname) {
        this.compname = compname == null ? null : compname.trim();
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin == null ? null : weixin.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPost() {
        return post;
    }

    public String getIfbasic() {
		return ifbasic;
	}

	public String getIfid() {
		return ifid;
	}

	public String getIfcontacts() {
		return ifcontacts;
	}

	public String getIfcarrier() {
		return ifcarrier;
	}

	public String getIfvideo() {
		return ifvideo;
	}

	public String getIfother() {
		return ifother;
	}

	public void setIfbasic(String ifbasic) {
		this.ifbasic = ifbasic;
	}

	public void setIfid(String ifid) {
		this.ifid = ifid;
	}

	public void setIfcontacts(String ifcontacts) {
		this.ifcontacts = ifcontacts;
	}

	public void setIfcarrier(String ifcarrier) {
		this.ifcarrier = ifcarrier;
	}

	public void setIfvideo(String ifvideo) {
		this.ifvideo = ifvideo;
	}

	public void setIfother(String ifother) {
		this.ifother = ifother;
	}

	public void setPost(String post) {
        this.post = post == null ? null : post.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getHeadpic() {
        return headpic;
    }

    public void setHeadpic(String headpic) {
        this.headpic = headpic == null ? null : headpic.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }


    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid == null ? null : cardid.trim();
    }

    public Integer getCreditfen() {
        return creditfen;
    }

    public void setCreditfen(Integer creditfen) {
        this.creditfen = creditfen;
    }

    public String getLastlogindate() {
        return lastlogindate;
    }

    public void setLastlogindate(String lastlogindate) {
        this.lastlogindate = lastlogindate;
    }

    public Integer getLogins() {
        return logins;
    }

    public void setLogins(Integer logins) {
        this.logins = logins;
    }

    public String getPwderrordate() {
        return pwderrordate;
    }

    public void setPwderrordate(String pwderrordate) {
        this.pwderrordate = pwderrordate;
    }

    public Integer getPwderrorlogins() {
        return pwderrorlogins;
    }

    public void setPwderrorlogins(Integer pwderrorlogins) {
        this.pwderrorlogins = pwderrorlogins;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getFromapp() {
        return fromapp;
    }

    public void setFromapp(String fromapp) {
        this.fromapp = fromapp == null ? null : fromapp.trim();
    }

    public String getFromchannel() {
        return fromchannel;
    }

    public void setFromchannel(String fromchannel) {
        this.fromchannel = fromchannel == null ? null : fromchannel.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

	public String getBelongto() {
		return belongto;
	}

	public void setBelongto(String belongto) {
		this.belongto = belongto;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}



	public Oper_user getOper_user() {
		return oper_user;
	}

	public void setOper_user(Oper_user oper_user) {
		this.oper_user = oper_user;
	}

	public String getOpuserid() {
		return opuserid;
	}

	public void setOpuserid(String opuserid) {
		this.opuserid = opuserid;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public String getCompaddress() {
		return compaddress;
	}

	public String getComptel() {
		return comptel;
	}

	public String getIncome() {
		return income;
	}

	public void setCompaddress(String compaddress) {
		this.compaddress = compaddress;
	}

	public void setComptel(String comptel) {
		this.comptel = comptel;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getIfmarriage() {
		return ifmarriage;
	}

	public String getEducation() {
		return education;
	}

	public void setIfmarriage(String ifmarriage) {
		this.ifmarriage = ifmarriage;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getGpsaddress() {
		return gpsaddress;
	}

	public void setGpsaddress(String gpsaddress) {
		this.gpsaddress = gpsaddress;
	}

	public String getIfrenzheng() {
		return ifrenzheng;
	}

	public void setIfrenzheng(String ifrenzheng) {
		this.ifrenzheng = ifrenzheng;
	}

	public String getIfoper() {
		return ifoper;
	}

	public void setIfoper(String ifoper) {
		this.ifoper = ifoper;
	}

	@Override
	public String toString() {
		return "Userinfo [userid=" + userid + ", loginname=" + loginname
				+ ", customerid=" + customerid + ", mobile=" + mobile
				+ ", password=" + password + ", belongto=" + belongto
				+ ", opuserid=" + opuserid + ", oper_user=" + oper_user
				+ ", uname=" + uname + ", nickname=" + nickname + ", compname="
				+ compname + ", compaddress=" + compaddress + ", comptel="
				+ comptel + ", income=" + income + ", areaid=" + areaid
				+ ", usertype=" + usertype + ", sex=" + sex + ", tel=" + tel
				+ ", qq=" + qq + ", weixin=" + weixin + ", email=" + email
				+ ", address=" + address + ", gpsaddress=" + gpsaddress
				+ ", post=" + post + ", birthday=" + birthday + ", headpic="
				+ headpic + ", status=" + status + ", balance=" + balance
				+ ", ifmarriage=" + ifmarriage + ", education=" + education
				+ ", cardid=" + cardid + ", creditfen=" + creditfen
				+ ", lastlogindate=" + lastlogindate + ", logins=" + logins
				+ ", pwderrordate=" + pwderrordate + ", pwderrorlogins="
				+ pwderrorlogins + ", latitude=" + latitude + ", longitude="
				+ longitude + ", fromapp=" + fromapp + ", fromchannel="
				+ fromchannel + ", remark=" + remark + ", createdate="
				+ createdate + ", ifbasic=" + ifbasic + ", ifid=" + ifid
				+ ", ifcontacts=" + ifcontacts + ", ifcarrier=" + ifcarrier
				+ ", ifvideo=" + ifvideo + ", ifother=" + ifother
				+ ", ifrenzheng=" + ifrenzheng + "]";
	}

	public String getCompid() {
		return compid;
	}

	public void setCompid(String compid) {
		this.compid = compid;
	}
	
	
}