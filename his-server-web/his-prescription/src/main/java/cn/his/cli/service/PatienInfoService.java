package cn.his.cli.service;

import cn.his.cli.mapper.PatienInfoMapper;
import cn.his.cli.pojo.hos.PatienInfo;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatienInfoService {


    @Autowired
    PatienInfoMapper patienInfoMapper;

    public List<PatienInfo> findAllPatiensWithVip() {
        return patienInfoMapper.findAllPatiensWithVip();
    }

    public boolean addPatienInfo(PatienInfo patienInfo){

        int flag = patienInfoMapper.addPatienInfo(patienInfo);
        return flag>0;
    }
}
