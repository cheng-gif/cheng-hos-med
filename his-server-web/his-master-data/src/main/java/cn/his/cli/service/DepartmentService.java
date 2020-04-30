package cn.his.cli.service;

import cn.his.cli.mapper.DepartmentMapper;
import cn.his.cli.pojo.hos.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> findAllDepWithUser(Integer id) {
        return departmentMapper.findAllDepWithUser(id);
    }
}
