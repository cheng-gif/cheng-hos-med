package cn.his.cli.controller;

import cn.his.cli.pojo.hos.Department;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.DepartmentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/dep")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @ApiOperation(value = "调用9007基础模块",notes = "两级联动动态查询dep、user下拉列表")
    @ApiImplicitParam(value = "科室id",name = "id")
    @GetMapping("/")
    public Response findAllDepWithUser(Integer id){
        List<Department> departments = departmentService.findAllDepWithUser(id);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(departments);
    }
}
