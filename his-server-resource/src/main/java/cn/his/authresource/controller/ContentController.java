package cn.his.authresource.controller;

import cn.his.authresource.pojo.TbContent;
import cn.his.authresource.service.ContentService;
import cn.his.authresource.pojo.TbContent;
import cn.his.authresource.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 允许第三方应用调用的api
 * 
 * @author Administrator
 *
 */
@RestController
@RequestMapping("content")
public class ContentController {
    @Autowired
    private ContentService contentService;

    @RequestMapping("list")
    public List<TbContent> queryAllContent(@RequestParam("categoryId") Long categoryId) {
        return contentService.queryAllContent(categoryId);

    }
}
