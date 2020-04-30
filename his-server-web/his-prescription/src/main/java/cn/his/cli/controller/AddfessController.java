package cn.his.cli.controller;

import cn.his.cli.pojo.hos.Addfess;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.AddfessService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/addfess")
public class AddfessController {

    @Autowired
    AddfessService addfessService;

    @ApiOperation(value = "调用9005新开就诊模块",notes = "查询所有附加费用信息")
    @GetMapping("/")
    public Response findAllAddfess(){
        List<Addfess> addfessList = addfessService.findAllAddfess();
        return new Response(ResponseEnum.SUCCESS).setResponseBody(addfessList);
    }
}
