package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.DiagInfo;

import java.util.List;

public interface DiagInfoMapper {
    List<DiagInfo> findAllDiagInfos();
}
