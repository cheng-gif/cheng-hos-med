package cn.his.cli.controller;

import cn.his.cli.pojo.TbUser;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
//必须配置
@SessionAttributes("authorizationRequest")
public class Oauth2Controller {

    @RequestMapping("/oauth/confirm_access")
    public String getAccessConfirmation() throws Exception {
        return "oauth/confirm_access";
    }
}
