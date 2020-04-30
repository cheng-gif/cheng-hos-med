package cn.his.cli.mapper;

import cn.his.cli.pojo.med.MenCheck;
import cn.his.cli.pojo.med.MenEast;
import cn.his.cli.pojo.med.MenWestern;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewDiagMapper {
    int addAdviceInfo(@Param("diagId") Integer diagId, @Param("adviceId") Integer[] adviceId);

    int addDiagInfo(@Param("diagId") Integer diagId, @Param("diagInfoId") Integer[] diagInfoId);

    int addItemCheck(@Param("menCheck") List<MenCheck> menCheck, @Param("newdiagId") Integer newdiagId);

    Integer getMaxNewdiagId();

    int addWesternInfo(@Param("menWesterns") List<MenWestern> menWesterns,@Param("newdiagId") Integer newdiagId);

    int addEastInfo(@Param("menEasts") List<MenEast> menEasts, @Param("newdiagId") Integer newdiagId);

    int addNewDiagInfo(@Param("consultationType") String consultationType, @Param("patienId") Integer patienId);
}
