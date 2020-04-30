package cn.his.cli.service;

import cn.his.cli.mapper.DiagInfoMapper;
import cn.his.cli.pojo.hos.DiagInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiagInfoService {

    @Autowired
    DiagInfoMapper diagInfoMapper;

    @Cacheable(value = "hos",key = "'findAllDiagInfos'")
    public List<DiagInfo> findAllDiagInfos() {
        return diagInfoMapper.findAllDiagInfos();
    }
}
