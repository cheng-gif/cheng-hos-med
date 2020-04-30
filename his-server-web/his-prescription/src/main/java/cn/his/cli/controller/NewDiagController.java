package cn.his.cli.controller;

import cn.his.cli.pojo.med.MenCheck;
import cn.his.cli.pojo.med.MenEast;
import cn.his.cli.pojo.med.MenWestern;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.NewDiagService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/newdiag")
public class NewDiagController {

    @Autowired
    NewDiagService newDiagService;

    @ApiOperation(value = "调用9005新开就诊模块",notes = "添加医嘱信息")
    @PostMapping("/add/advice")
    public Response addAdviceInfo(Integer[] adviceId){
        if (newDiagService.addAdviceInfo(adviceId)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }

    @ApiOperation(value = "调用9005新开就诊模块",notes = "添加诊断信息")
    @PostMapping("/add/diaginfo")
    public Response addDiagInfo(Integer[] diagInfoId){
        if (newDiagService.addDiagInfo(diagInfoId)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }

    @ApiOperation(value = "调用9005新开就诊模块",notes = "添加检查项目明细")
    @ApiImplicitParam(value = "检查明细对象",name = "List<MenCheck> menCheck")
    @PostMapping("/addcheck")
    public Response addItemCheck(@RequestBody List<MenCheck> menCheck){
        if (newDiagService.addItemCheck(menCheck)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }

    @ApiOperation(value = "调用9005新开就诊模块",notes = "添加西药处方明细")
    @ApiImplicitParam(value = "西药处方对象",name = "List<MenWestern> menWesterns")
    @PostMapping("/addWestern")
    public Response addWesternInfo(@RequestBody List<MenWestern> menWesterns){
        if (newDiagService.addWesternInfo(menWesterns)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }

    @ApiOperation(value = "调用9005新开就诊模块",notes = "添加中药处方明细")
    @ApiImplicitParam(value = "中药处方对象",name = "List<MenEast> menEasts")
    @PostMapping("/addEast")
    public Response addEastInfo(@RequestBody List<MenEast> menEasts){
        if (newDiagService.addEastInfo(menEasts)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }

    @PostMapping("/addNewDiag")
    public Response addNewDiagInfo(String consultationType,Integer patienId){
        if (newDiagService.addNewDiagInfo(consultationType,patienId)){
            return new Response(ResponseEnum.SUCCESS);
        }
        return new Response(ResponseEnum.ERROR);
    }
}
