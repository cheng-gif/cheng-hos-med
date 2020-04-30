package cn.his.cli.controller;

import cn.his.cli.pojo.hos.PatienInfo;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.PatienInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/patieninfo")
public class PatienInfoController {

    @Autowired
    PatienInfoService patienInfoService;

    @ApiOperation(value = "调用9005新开就诊模块",notes = "根据会员表id与患者表member_id查询所有患者信息")
    @GetMapping("/")
    public Response findAllPatiensWithVip(){
        List<PatienInfo> patienInfos = patienInfoService.findAllPatiensWithVip();
        return new Response(ResponseEnum.SUCCESS).setResponseBody(patienInfos);
    }

    @PostMapping("/")
    public Response addPatienInfo(PatienInfo patienInfo){
        if (patienInfoService.addPatienInfo(patienInfo)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }
}
