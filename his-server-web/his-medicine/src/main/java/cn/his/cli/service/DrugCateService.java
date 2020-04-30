package cn.his.cli.service;

import cn.his.cli.mapper.DrugCateMapper;
import cn.his.cli.pojo.hos.DrugCate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DrugCateService {

    @Autowired
    DrugCateMapper drugCateMapper;

    public List<DrugCate> getAllDrugCates() {
        return drugCateMapper.getAllDrugCates();
    }

    public List<DrugCate> findCateById(Integer typeId) {
        return drugCateMapper.findCateById(typeId);
    }
}
