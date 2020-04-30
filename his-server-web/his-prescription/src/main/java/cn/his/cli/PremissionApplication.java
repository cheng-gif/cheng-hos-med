package cn.his.cli;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
@MapperScan(value = "cn.his.cli.mapper")
public class PremissionApplication {

    public static void main(String[] args) {
        SpringApplication.run(PremissionApplication.class,args);
    }
}
