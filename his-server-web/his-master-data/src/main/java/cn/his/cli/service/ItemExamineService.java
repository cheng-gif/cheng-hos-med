package cn.his.cli.service;

import cn.his.cli.mapper.ItemExamineMapper;
import cn.his.cli.pojo.hos.ItemExamine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemExamineService {

    @Autowired
    ItemExamineMapper itemExamineMapper;

    public List<ItemExamine> findAllByCateIdAndCateName(Integer cateId, String cateName) {
        return itemExamineMapper.findAllByCateIdAndCateName(cateId,cateName);
    }
}
