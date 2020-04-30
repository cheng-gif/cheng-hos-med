package cn.t215.mail;

import org.springframework.amqp.core.Queue;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SendMailApp {
    public static void main(String[] args) {
        SpringApplication.run(SendMailApp.class);
    }

    @Bean
    Queue queue(){
        return new Queue("chenglong");
    }
}
