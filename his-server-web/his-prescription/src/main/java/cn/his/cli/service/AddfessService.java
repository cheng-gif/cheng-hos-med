package cn.his.cli.service;

import cn.his.cli.mapper.AddfessMapper;
import cn.his.cli.pojo.hos.Addfess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddfessService {

    @Autowired
    AddfessMapper addfessMapper;

    public List<Addfess> findAllAddfess() {
        return addfessMapper.findAllAddfess();
    }
}
