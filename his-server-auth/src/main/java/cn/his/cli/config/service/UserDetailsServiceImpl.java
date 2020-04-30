package cn.his.cli.config.service;

import cn.his.cli.pojo.TbPermission;
import cn.his.cli.pojo.TbUser;
import cn.his.cli.service.TbPermissionService;
import cn.his.cli.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    TbUserService tbUserService;
    @Autowired
    TbPermissionService tbPermissionService;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TbUser tbUser = tbUserService.getUserByUsername(username);
        if (tbUser == null){
            throw new UsernameNotFoundException("username:"+username+"is not exist");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        //获取用户权限
        List<TbPermission> permissions = tbPermissionService.getByUserid(tbUser.getId());
        //设置用户权限
        for (TbPermission permission : permissions){
            authorities.add(new SimpleGrantedAuthority(permission.getEname()));
        }
        //返回认证用户
        return new User(tbUser.getUsername(),tbUser.getPassword(),authorities);
    }
}
