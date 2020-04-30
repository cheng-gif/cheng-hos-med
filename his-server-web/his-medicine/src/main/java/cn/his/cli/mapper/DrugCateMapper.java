package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.DrugCate;

import java.util.List;

public interface DrugCateMapper {
    List<DrugCate> getAllDrugCates();

    List<DrugCate> findCateById(Integer typeId);
}
