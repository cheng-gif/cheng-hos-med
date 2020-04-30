package cn.his.cli.service;

import cn.his.cli.mapper.PreTemplateMapper;
import cn.his.cli.pojo.hos.PreTemplate;
import cn.his.cli.pojo.med.MenCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PreTemplateService {

    @Autowired
    PreTemplateMapper preTemplateMapper;

    public List<PreTemplate> findAllTemplateByIdAndPremiss(Integer typeId, Integer premiss, String chooise) {

        return  preTemplateMapper.findAllTemplateByIdAndPremiss(typeId,premiss,chooise);
    }

    public PreTemplate findByTempId(Integer id) {
        return preTemplateMapper.findByTempId(id);
    }

    public PreTemplate findByTempIdWithItemExine(Integer id) {
        return preTemplateMapper.findByTempIdWithItemExine(id);
    }

}
