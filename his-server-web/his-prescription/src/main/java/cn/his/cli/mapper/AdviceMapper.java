package cn.his.cli.mapper;

import cn.his.cli.pojo.hos.Advice;

import java.util.List;

public interface AdviceMapper {
    List<Advice> findAllAdvices();
}
