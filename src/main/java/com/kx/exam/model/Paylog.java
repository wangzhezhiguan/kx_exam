package com.kx.exam.model;

import java.util.Date;

public class Paylog {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.paylogid
     *
     * @mbg.generated
     */
    private String paylogid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.opuserid
     *
     * @mbg.generated
     */
    private String opuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.userid
     *
     * @mbg.generated
     */
    private String userid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.customer_order_no
     *
     * @mbg.generated
     */
    private String customerOrderNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.customer_name
     *
     * @mbg.generated
     */
    private String customerName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.bank_card_num
     *
     * @mbg.generated
     */
    private String bankCardNum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.amount
     *
     * @mbg.generated
     */
    private Double amount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.mobile
     *
     * @mbg.generated
     */
    private String mobile;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.merchant_order_no
     *
     * @mbg.generated
     */
    private String merchantOrderNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.ext_order_no
     *
     * @mbg.generated
     */
    private String extOrderNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.status
     *
     * @mbg.generated
     */
    private String status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.pay_order_no
     *
     * @mbg.generated
     */
    private String payOrderNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.repay_status
     *
     * @mbg.generated
     */
    private String repayStatus;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.repay_date
     *
     * @mbg.generated
     */
    private String repayDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.cancel_status
     *
     * @mbg.generated
     */
    private String cancelStatus;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column xt_paylog.createdate
     *
     * @mbg.generated
     */
    private String createdate;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.paylogid
     *
     * @return the value of xt_paylog.paylogid
     *
     * @mbg.generated
     */
    public String getPaylogid() {
        return paylogid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.paylogid
     *
     * @param paylogid the value for xt_paylog.paylogid
     *
     * @mbg.generated
     */
    public void setPaylogid(String paylogid) {
        this.paylogid = paylogid == null ? null : paylogid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.opuserid
     *
     * @return the value of xt_paylog.opuserid
     *
     * @mbg.generated
     */
    public String getOpuserid() {
        return opuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.opuserid
     *
     * @param opuserid the value for xt_paylog.opuserid
     *
     * @mbg.generated
     */
    public void setOpuserid(String opuserid) {
        this.opuserid = opuserid == null ? null : opuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.userid
     *
     * @return the value of xt_paylog.userid
     *
     * @mbg.generated
     */
    public String getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.userid
     *
     * @param userid the value for xt_paylog.userid
     *
     * @mbg.generated
     */
    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.customer_order_no
     *
     * @return the value of xt_paylog.customer_order_no
     *
     * @mbg.generated
     */
    public String getCustomerOrderNo() {
        return customerOrderNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.customer_order_no
     *
     * @param customerOrderNo the value for xt_paylog.customer_order_no
     *
     * @mbg.generated
     */
    public void setCustomerOrderNo(String customerOrderNo) {
        this.customerOrderNo = customerOrderNo == null ? null : customerOrderNo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.customer_name
     *
     * @return the value of xt_paylog.customer_name
     *
     * @mbg.generated
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.customer_name
     *
     * @param customerName the value for xt_paylog.customer_name
     *
     * @mbg.generated
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.bank_card_num
     *
     * @return the value of xt_paylog.bank_card_num
     *
     * @mbg.generated
     */
    public String getBankCardNum() {
        return bankCardNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.bank_card_num
     *
     * @param bankCardNum the value for xt_paylog.bank_card_num
     *
     * @mbg.generated
     */
    public void setBankCardNum(String bankCardNum) {
        this.bankCardNum = bankCardNum == null ? null : bankCardNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.amount
     *
     * @return the value of xt_paylog.amount
     *
     * @mbg.generated
     */
    public Double getAmount() {
        return amount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.amount
     *
     * @param amount the value for xt_paylog.amount
     *
     * @mbg.generated
     */
    public void setAmount(Double amount) {
        this.amount = amount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.mobile
     *
     * @return the value of xt_paylog.mobile
     *
     * @mbg.generated
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.mobile
     *
     * @param mobile the value for xt_paylog.mobile
     *
     * @mbg.generated
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.merchant_order_no
     *
     * @return the value of xt_paylog.merchant_order_no
     *
     * @mbg.generated
     */
    public String getMerchantOrderNo() {
        return merchantOrderNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.merchant_order_no
     *
     * @param merchantOrderNo the value for xt_paylog.merchant_order_no
     *
     * @mbg.generated
     */
    public void setMerchantOrderNo(String merchantOrderNo) {
        this.merchantOrderNo = merchantOrderNo == null ? null : merchantOrderNo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.ext_order_no
     *
     * @return the value of xt_paylog.ext_order_no
     *
     * @mbg.generated
     */
    public String getExtOrderNo() {
        return extOrderNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.ext_order_no
     *
     * @param extOrderNo the value for xt_paylog.ext_order_no
     *
     * @mbg.generated
     */
    public void setExtOrderNo(String extOrderNo) {
        this.extOrderNo = extOrderNo == null ? null : extOrderNo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.status
     *
     * @return the value of xt_paylog.status
     *
     * @mbg.generated
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.status
     *
     * @param status the value for xt_paylog.status
     *
     * @mbg.generated
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.pay_order_no
     *
     * @return the value of xt_paylog.pay_order_no
     *
     * @mbg.generated
     */
    public String getPayOrderNo() {
        return payOrderNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.pay_order_no
     *
     * @param payOrderNo the value for xt_paylog.pay_order_no
     *
     * @mbg.generated
     */
    public void setPayOrderNo(String payOrderNo) {
        this.payOrderNo = payOrderNo == null ? null : payOrderNo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.repay_status
     *
     * @return the value of xt_paylog.repay_status
     *
     * @mbg.generated
     */
    public String getRepayStatus() {
        return repayStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.repay_status
     *
     * @param repayStatus the value for xt_paylog.repay_status
     *
     * @mbg.generated
     */
    public void setRepayStatus(String repayStatus) {
        this.repayStatus = repayStatus == null ? null : repayStatus.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.repay_date
     *
     * @return the value of xt_paylog.repay_date
     *
     * @mbg.generated
     */
    public String getRepayDate() {
        return repayDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.repay_date
     *
     * @param repayString the value for xt_paylog.repay_date
     *
     * @mbg.generated
     */
    public void setRepayDate(String repayDate) {
        this.repayDate = repayDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.cancel_status
     *
     * @return the value of xt_paylog.cancel_status
     *
     * @mbg.generated
     */
    public String getCancelStatus() {
        return cancelStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.cancel_status
     *
     * @param cancelStatus the value for xt_paylog.cancel_status
     *
     * @mbg.generated
     */
    public void setCancelStatus(String cancelStatus) {
        this.cancelStatus = cancelStatus == null ? null : cancelStatus.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column xt_paylog.createdate
     *
     * @return the value of xt_paylog.createdate
     *
     * @mbg.generated
     */
    public String getCreatedate() {
        return createdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column xt_paylog.createdate
     *
     * @param createdate the value for xt_paylog.createdate
     *
     * @mbg.generated
     */
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }
}