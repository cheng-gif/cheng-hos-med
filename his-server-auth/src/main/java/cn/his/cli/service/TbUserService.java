package cn.his.cli.service;

import cn.his.cli.mapper.TbUserMapper;
import cn.his.cli.pojo.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbUserService {

    @Autowired
    TbUserMapper tbUserMapper;

    public TbUser getUserByUsername(String username){
        return tbUserMapper.getByUsername(username);
    }
}
