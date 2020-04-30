package cn.his.cli.service;

import cn.his.cli.mapper.ItemCateMapper;
import cn.his.cli.pojo.hos.ItemCate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemCateService {

    @Autowired
    ItemCateMapper itemCateMapper;

    public List<ItemCate> findAllItemCate() {
        return itemCateMapper.findAllItemCate();
    }
}
