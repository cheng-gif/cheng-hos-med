package cn.his.cli.controller;

import cn.his.cli.http.HttpClientHelper;
import cn.his.cli.response.Response;
import com.alibaba.druid.util.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Api
@RestController
@RequestMapping("/api")
public class PreOtherController {
    @Value("${server.medicine.url}")
    private String serverMedicineUrl;
    @Value("${server.masterdata.url}")
    private String serverMasterdataUrl;

    @Autowired
    HttpClientHelper httpClientHelper;

    @ApiOperation(value = "调用9007基础模块api,两级联动动态查询dep、user下拉列表")
    @ApiImplicitParam(value = "科室id",name = "id")
    @GetMapping("/")
    public Response findAllDepWithUser(Integer id){
        return httpClientHelper.getForResponse(serverMasterdataUrl+"/api/dep/?id="+id);
    }

    @ApiOperation(value = "调用9007基础模块api,获得所有项目分类信息")
    @GetMapping("/getItemCate")
    public Response findAllItemCate(){
        return httpClientHelper.getForResponse(serverMasterdataUrl+"/api/itemCate/");
    }

    @ApiOperation(value = "调用9007基础模块api,按条件获取项目检查信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "分类Id",name = "cateId"),
            @ApiImplicitParam(value = "项目名称",name = "cateName")
    })
    @GetMapping("/findExamine")
    public Response findAllByCateIdAndCateName(Integer cateId,String cateName) throws UnsupportedEncodingException {
        StringBuffer buffer = new StringBuffer();
        if (cateId!=null){
            buffer.append("?cateId=").append(cateId);
        }
        if (!StringUtils.isEmpty(cateName)){
            buffer.append("&cateName=").append(URLEncoder.encode(cateName,"utf-8"));
        }
        return httpClientHelper.getForResponse(serverMasterdataUrl+"/api/itemExamine/"+buffer);
    }

    @ApiOperation(value = "调用9006药品模块api,获得所有药品分类信息")
    @GetMapping("/drugCate")
    public Response getAllDrugCates(){
        return httpClientHelper.getForResponse(serverMedicineUrl+"/api/drugcates/");
    }

    @ApiOperation(value = "调用药品模块api,分页查询药品列表",response = Response.class)
    @ApiImplicitParams({
            @ApiImplicitParam(value = "页码，查询第几页数据,必填",name = "pageNum", required = true),
            @ApiImplicitParam(value = "每页显示几条,必填",name = "pageSize", required = true),
            @ApiImplicitParam(value = "药品分类ID",name = "typeId"),
            @ApiImplicitParam(value = "药品名称，模糊匹配",name = "cateName")
    })
    @GetMapping("/findAll")
    public Response findAll(Integer pageNum, Integer pageSize,
                            Integer typeId,String cateName) throws UnsupportedEncodingException {
        if(pageNum == null) pageNum = 1;
        if(pageSize == null) pageSize = 5;
        StringBuffer buffer = new StringBuffer("?").append("pageNum=").append(pageNum).append("&pageSize=").append(pageSize);
        if(typeId!=null) {
            buffer.append("&typeId=").append(typeId);
        }
        if(!StringUtils.isEmpty(cateName)) {
            buffer.append("&cateName=").append(URLEncoder.encode(cateName, "UTF-8"));
        }
        return httpClientHelper.getForResponse(serverMedicineUrl+"/api/medicines/"+buffer);
    }

    @GetMapping("/findCate")
    public Response findCates(Integer typeId){
        StringBuffer buffer = new StringBuffer();
        if (typeId!=null && typeId!=0){
            buffer.append("?typeId="+typeId);
        }
        return httpClientHelper.getForResponse(serverMedicineUrl+"/api/drugcates/findCates"+buffer);
    }
}
