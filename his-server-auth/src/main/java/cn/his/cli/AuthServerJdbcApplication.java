package cn.his.cli;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = "cn.his.cli.mapper")
public class AuthServerJdbcApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthServerJdbcApplication.class,args);
    }
}
