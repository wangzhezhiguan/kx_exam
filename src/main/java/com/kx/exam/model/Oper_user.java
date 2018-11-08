package com.kx.exam.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "xt_oper_user")
public class Oper_user {//@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id    
    @GeneratedValue(generator="UUID") 
    private String opuserid;

    private String username;//登录名
    
    private String opname;//姓名
    private String weixin;//业务员微信
    private String qrcode;//推广二维码
    private String mobile;//手机号码
    private String belongto;//手机归属地
    private String password;
    private String customerid;//商户号
    private String compid;//渠道ID
    private String ifoper;//是否后台管理员 0非系统管理员，1为系统管理员

    private String email;
    @Transient 
    private String compname;
    @Transient 
    private Double balance;
    @Transient 
    private Double smsbalance;
    
    public String getIfoper() {
		return ifoper;
	}

	public void setIfoper(String ifoper) {
		this.ifoper = ifoper;
	}

	@Transient
    private AuthRole role;
    
    @Transient
    private int status;

    /**
     * 是否可用(0禁用,1可用)
     */
    private Integer useable;

    /**
     * 所属角色
     */
    private String roleid;

    /**
     * 创建时间
     */
    private String addtime;

    /**
     * 登陆时间
     */
    private String logintime;

    /**
     * 登陆IP
     */
    private String loginip;

   

    /**
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取是否可用(0禁用,1可用)
     *
     * @return useable - 是否可用(0禁用,1可用)
     */
    public Integer getUseable() {
        return useable;
    }

    /**
     * 设置是否可用(0禁用,1可用)
     *
     * @param useable 是否可用(0禁用,1可用)
     */
    public void setUseable(Integer useable) {
        this.useable = useable;
    }

    /**
     * 获取所属角色
     *
     * @return roleid - 所属角色
     */
    public String getRoleid() {
        return roleid;
    }

    /**
     * 设置所属角色
     *
     * @param roleid 所属角色
     */
    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    /**
     * 获取创建时间
     *
     * @return addtime - 创建时间
     */
    public String getAddtime() {
        return addtime;
    }

    /**
     * 设置创建时间
     *
     * @param addtime 创建时间
     */
    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    /**
     * 获取登陆时间
     *
     * @return logintime - 登陆时间
     */
    public String getLogintime() {
        return logintime;
    }

    /**
     * 设置登陆时间
     *
     * @param logintime 登陆时间
     */
    public void setLogintime(String logintime) {
        this.logintime = logintime;
    }

    /**
     * 获取登陆IP
     *
     * @return loginip - 登陆IP
     */
    public String getLoginip() {
        return loginip;
    }

    /**
     * 设置登陆IP
     *
     * @param loginip 登陆IP
     */
    public void setLoginip(String loginip) {
        this.loginip = loginip;
    }

	public AuthRole getRole() {
		return role;
	}

	public String getOpname() {
		return opname;
	}

	public void setOpname(String opname) {
		this.opname = opname;
	}

	public void setRole(AuthRole role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getOpuserid() {
		return opuserid;
	}

	public void setOpuserid(String opuserid) {
		this.opuserid = opuserid;
	}


	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getBelongto() {
		return belongto;
	}

	public void setBelongto(String belongto) {
		this.belongto = belongto;
	}

	public String getWeixin() {
		return weixin;
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	public String getCompid() {
		return compid;
	}

	public void setCompid(String compid) {
		this.compid = compid;
	}

	public String getCompname() {
		return compname;
	}

	public Double getBalance() {
		return balance;
	}

	public Double getSmsbalance() {
		return smsbalance;
	}

	public void setCompname(String compname) {
		this.compname = compname;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public void setSmsbalance(Double smsbalance) {
		this.smsbalance = smsbalance;
	}
}