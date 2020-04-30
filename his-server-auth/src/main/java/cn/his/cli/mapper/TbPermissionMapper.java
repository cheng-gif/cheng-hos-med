package cn.his.cli.mapper;

import cn.his.cli.pojo.TbPermission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TbPermissionMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TbPermission queryById(Long id);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbPermission 实例对象
     * @return 对象列表
     */
    List<TbPermission> queryAll(TbPermission tbPermission);

    List<TbPermission> queryByUserid(Long userId);

    /**
     * 新增数据
     *
     * @param tbPermission 实例对象
     * @return 影响行数
     */
    int insert(TbPermission tbPermission);

    /**
     * 修改数据
     *
     * @param tbPermission 实例对象
     * @return 影响行数
     */
    int update(TbPermission tbPermission);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);
}
