package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.DrugInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DrugInfomationMapper {

    List<DrugInformation> findAll(@Param("typeId") Integer typeId,
                                  @Param("cateName") String cateName);
}
