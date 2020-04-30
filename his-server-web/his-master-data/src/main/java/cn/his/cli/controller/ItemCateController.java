package cn.his.cli.controller;


import cn.his.cli.pojo.hos.ItemCate;
import cn.his.cli.response.Response;
import cn.his.cli.response.ResponseEnum;
import cn.his.cli.service.ItemCateService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api
@RestController
@RequestMapping("/api/itemCate")
public class ItemCateController {

    @Autowired
    ItemCateService itemCateService;

    @GetMapping("/")
    public Response findAllItemCate(){
        List<ItemCate> itemCateList = itemCateService.findAllItemCate();
        return new Response(ResponseEnum.SUCCESS).setResponseBody(itemCateList);
    }
}
