package cn.his.authresource.service;


import cn.his.authresource.pojo.TbContent;
import cn.his.authresource.mapper.TbContentMapper;
import cn.his.authresource.mapper.TbContentMapper;
import cn.his.authresource.pojo.TbContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentService {


    @Autowired
    private TbContentMapper contentMapper;

    public List<TbContent> queryAllContent(Long categoryId) {
        return contentMapper.queryByCategoryid(categoryId);
    }
}
