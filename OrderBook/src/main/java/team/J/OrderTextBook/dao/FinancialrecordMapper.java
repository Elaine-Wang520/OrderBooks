package team.J.OrderTextBook.dao;

import org.apache.ibatis.annotations.Param;
import team.J.OrderTextBook.pojo.Financialrecord;

import java.util.List;

public interface FinancialrecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Financialrecord record);

    Financialrecord selectByPrimaryKey(Integer id);

    List<Financialrecord> selectAll();

    int updateByPrimaryKey(Financialrecord record);

    List<Financialrecord> selectByPage(@Param(value = "page") Integer page, @Param(value = "count") Integer count);
}