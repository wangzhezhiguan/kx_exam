package com.kx.exam.mapper;

import com.kx.exam.model.Paylog;
import java.util.List;

public interface PaylogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table xt_paylog
     *
     * @mbg.generated
     */
    int deleteById(String paylogid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table xt_paylog
     *
     * @mbg.generated
     */
    int insert(Paylog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table xt_paylog
     *
     * @mbg.generated
     */
    Paylog selectById(String paylogid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table xt_paylog
     *
     * @mbg.generated
     */
    List<Paylog> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table xt_paylog
     *
     * @mbg.generated
     */
    int updateById(Paylog record);
}