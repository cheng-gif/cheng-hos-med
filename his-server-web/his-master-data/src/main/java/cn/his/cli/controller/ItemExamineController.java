package cn.his.cli.controller;

import cn.his.cli.pojo.hos.ItemExamine;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.ItemExamineService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/itemExamine")
public class ItemExamineController {

    @Autowired
    ItemExamineService itemExamineService;

    @GetMapping("/")
    public Response findAllByCateIdAndCateName(Integer cateId,String cateName){
        List<ItemExamine> itemExamines = itemExamineService.findAllByCateIdAndCateName(cateId,cateName);
        return new Response(ResponseEnum.SUCCESS).setResponseBody(itemExamines);
    }
}
