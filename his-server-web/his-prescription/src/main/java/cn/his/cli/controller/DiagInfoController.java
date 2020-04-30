package cn.his.cli.controller;

import cn.his.cli.pojo.hos.DiagInfo;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.DiagInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/diagInfo")
public class DiagInfoController {

    @Autowired
    DiagInfoService diagInfoService;

    @ApiOperation(value = "调用9005新开就诊模块",notes = "查询所有诊断信息")
    @GetMapping("/")
    public Response findAllDiagInfos(){
        List<DiagInfo> diagInfos = diagInfoService.findAllDiagInfos();
        return new Response(ResponseEnum.SUCCESS).setResponseBody(diagInfos);
    }
}
