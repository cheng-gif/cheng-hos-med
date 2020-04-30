package cn.his.cli.service;

import cn.his.cli.mapper.NewDiagMapper;
import cn.his.cli.mapper.PatienInfoMapper;
import cn.his.cli.pojo.hos.PatienInfo;
import cn.his.cli.pojo.med.MenCheck;
import cn.his.cli.pojo.med.MenEast;
import cn.his.cli.pojo.med.MenWestern;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewDiagService {

    @Autowired
    NewDiagMapper newDiagMapper;
    @Autowired
    PatienInfoMapper patienInfoMapper;
    @Autowired
    RabbitTemplate rabbitTemplate;

    public boolean addAdviceInfo(Integer[] adviceId) {
        Integer newdiagId = newDiagMapper.getMaxNewdiagId();
        return newDiagMapper.addAdviceInfo(newdiagId,adviceId)==adviceId.length;
    }

    public boolean addDiagInfo(Integer[] diagInfoId) {
        Integer newdiagId = newDiagMapper.getMaxNewdiagId();
        return newDiagMapper.addDiagInfo(newdiagId,diagInfoId)==diagInfoId.length;
    }

    public boolean addItemCheck(List<MenCheck> menCheck) {
        Integer newdiagId = newDiagMapper.getMaxNewdiagId();//获得最大的新开就诊主键id
        return newDiagMapper.addItemCheck(menCheck,newdiagId)>0;
    }

    @Transactional
    public boolean addWesternInfo(List<MenWestern> menWesterns) {
        Integer newdiagId = newDiagMapper.getMaxNewdiagId();//获得最大的新开就诊主键id
        return newDiagMapper.addWesternInfo(menWesterns,newdiagId)>0;
    }

    public boolean addEastInfo(List<MenEast> menEasts) {
        Integer newdiagId = newDiagMapper.getMaxNewdiagId();//获得最大的新开就诊主键id
        return newDiagMapper.addEastInfo(menEasts,newdiagId)>0;
    }

    public boolean addNewDiagInfo(String consultationType, Integer patienId) {
        PatienInfo patien = patienInfoMapper.getPatienInfoById(patienId);
        rabbitTemplate.convertAndSend("chenglong",patien);
        return newDiagMapper.addNewDiagInfo(consultationType,patienId)>0;
    }
}
