package cn.his.cli.controller;

import cn.his.cli.pojo.hos.PreTemplate;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.PreTemplateService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/template")
public class PreTemplateController {

    @Autowired
    PreTemplateService preTemplateService;

    @ApiOperation(value = "调用9005新开就诊模块",notes = "按条件查询处方模板信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "处方类型",name = "typeId"),
            @ApiImplicitParam(value = "模板权限",name = "premiss",defaultValue = "0"),
            @ApiImplicitParam(value = "模糊条件查询",name = "chooise")
    })
    @GetMapping("/")
    public Response findAllTemplateByIdAndPremiss(Integer typeId,Integer premiss,String chooise){
        List<PreTemplate> templates = preTemplateService.findAllTemplateByIdAndPremiss(typeId,premiss,chooise);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(templates);
    }

    @ApiOperation(value = "调用9005新开就诊模块",notes = "按模板id查询药品信息")
    @ApiImplicitParam(value = "模板id",name = "id")
    @GetMapping("/show")
    public Response findByTempId(Integer id){
        PreTemplate preTemplate = preTemplateService.findByTempId(id);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(preTemplate);
    }

    @ApiOperation(value = "调用9005新开就诊模块",notes = "按模板id查询项目配置信息")
    @ApiImplicitParam(value = "项目检查id",name = "id")
    @GetMapping("/item/{id}")
    public Response findByTempIdWithItemExine(@PathVariable Integer id){
        PreTemplate preTemplate = preTemplateService.findByTempIdWithItemExine(id);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(preTemplate);
    }
}
