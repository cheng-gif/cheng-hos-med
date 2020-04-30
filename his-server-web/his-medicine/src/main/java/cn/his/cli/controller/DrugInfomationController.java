package cn.his.cli.controller;

import cn.his.cli.pojo.hos.DrugInformation;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.DrugInfomationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/medicines")
public class DrugInfomationController {

    @Autowired
    DrugInfomationService drugInformationService;


    @ApiOperation(value = "调用9006药品模块",notes = "根据药品类型id动态查询或者根据药品中文名、药品拼音模糊查询")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "页码",name = "pageNum",required = true),
            @ApiImplicitParam(value = "每页显示数量",name = "pageSize",required = true),
            @ApiImplicitParam(value = "药品分类id",name = "typeId",defaultValue = "0"),
            @ApiImplicitParam(value = "药品名",name = "cateName")
    })
    @GetMapping("/")
    public Response findAll(Integer pageNum, Integer pageSize,
                            Integer typeId,String cateName){
        PageHelper.startPage(pageNum,pageSize);
        List<DrugInformation> informations = drugInformationService.findAll(typeId,cateName);
        PageInfo<DrugInformation> pageInfo = new PageInfo<>(informations);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(pageInfo);
    }
}
