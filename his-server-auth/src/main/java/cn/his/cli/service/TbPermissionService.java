package cn.his.cli.service;

import cn.his.cli.mapper.TbPermissionMapper;
import cn.his.cli.pojo.TbPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbPermissionService {

    @Autowired
    TbPermissionMapper tbPermissionMapper;

    public List<TbPermission> getByUserid(long userId){
        return tbPermissionMapper.queryByUserid(userId);
    }
}
