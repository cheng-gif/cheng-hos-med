package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {
    List<Department> findAllDepWithUser(@Param("id") Integer id);
}
