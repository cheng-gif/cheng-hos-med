package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.PreTemplate;
import cn.his.cli.pojo.med.MenCheck;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PreTemplateMapper {
    List<PreTemplate> findAllTemplateByIdAndPremiss(@Param("typeId") Integer typeId,
                                                    @Param("premiss") Integer premiss,
                                                    @Param("chooise") String chooise);

    PreTemplate findByTempId(Integer id);

    PreTemplate findByTempIdWithItemExine(@Param("id") Integer id);

}
