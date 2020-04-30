package cn.his.cli.service;

import cn.his.cli.mapper.DrugInfomationMapper;
import cn.his.cli.pojo.hos.DrugInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DrugInfomationService {

    @Autowired
    DrugInfomationMapper drugInfomationMapper;

    public List<DrugInformation> findAll(Integer typeId,String cateName) {
        return drugInfomationMapper.findAll(typeId,cateName);
    }
}
