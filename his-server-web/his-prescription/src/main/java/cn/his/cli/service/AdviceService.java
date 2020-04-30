package cn.his.cli.service;

import cn.his.cli.mapper.AdviceMapper;
import cn.his.cli.pojo.hos.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdviceService {

    @Autowired
    AdviceMapper adviceMapper;

    @Cacheable(value = "hos",key = "'findAllAdvices'")
    public List<Advice> findAllAdvices() {
        return adviceMapper.findAllAdvices();
    }
}
