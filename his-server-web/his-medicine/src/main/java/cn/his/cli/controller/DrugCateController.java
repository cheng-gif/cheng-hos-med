package cn.his.cli.controller;

import cn.his.cli.pojo.hos.DrugCate;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.DrugCateService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/drugcates")
public class DrugCateController {

    @Autowired
    DrugCateService drugCateService;

    @ApiOperation(value = "调用9006药品分类模块",notes = "查询所有药品分类信息")
    @GetMapping("/")
    public Response getAllDrugCates(){
        List<DrugCate> drugCates = drugCateService.getAllDrugCates();
        return new Response(ResponseEnum.SUCCESS).setResponseBody(drugCates);
    }

    @GetMapping("/findCates")
    public Response getCatesByTypeId(Integer typeId){
        List<DrugCate> drugCateList = drugCateService.findCateById(typeId);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(drugCateList);
    }
}
