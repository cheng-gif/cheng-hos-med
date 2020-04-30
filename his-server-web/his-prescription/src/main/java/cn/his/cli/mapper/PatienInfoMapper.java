package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.PatienInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PatienInfoMapper {
    List<PatienInfo> findAllPatiensWithVip();

    int addPatienInfo(@Param("patienInfo") PatienInfo patienInfo);

    PatienInfo getPatienInfoById(Integer id);
}
