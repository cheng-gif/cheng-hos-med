package cn.his.cli.controller;

import cn.his.cli.pojo.hos.Advice;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.AdviceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/advices")
public class AdviceController {

    @Autowired
    AdviceService adviceService;

    @ApiOperation(value = "调用9005新开就诊模块",notes = "查询所有医嘱信息")
    @GetMapping("/")
    public Response findAllAdvices(){
        List<Advice> advices = adviceService.findAllAdvices();
        return new Response(ResponseEnum.SUCCESS).setResponseBody(advices);
    }
}
