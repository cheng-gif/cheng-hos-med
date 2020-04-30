package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.ItemExamine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemExamineMapper {
    List<ItemExamine> findAllByCateIdAndCateName(@Param("cateId") Integer cateId,
                                                 @Param("cateName") String cateName);
}
