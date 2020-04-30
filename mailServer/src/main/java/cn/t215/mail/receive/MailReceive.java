package cn.t215.mail.receive;

import cn.his.cli.pojo.hos.PatienInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.mail.MailProperties;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Date;

@Component
@Slf4j
public class MailReceive {

    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    MailProperties mailProperties;
    @Autowired
    TemplateEngine engine;

    @RabbitListener(queues = "chenglong")
    public void handler(PatienInfo patienInfo){
        log.info("aa");
        //收到消息，发送邮件
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        try {
            helper.setTo("610191902@qq.com");
            helper.setFrom(mailProperties.getUsername());
            helper.setSubject("欢迎来到长沙肛泰医院！");
            helper.setSentDate(new Date());
            Context context = new Context();
            context.setVariable("name",patienInfo.getName());
            context.setVariable("cardNo",patienInfo.getCardNo());
            context.setVariable("age",patienInfo.getAge());
            context.setVariable("phone",patienInfo.getPhone());
            context.setVariable("birthday",patienInfo.getBirthday());
            String mail = engine.process("mail", context);
            helper.setText(mail,true);
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
            log.error("邮件发送失败:"+e.getMessage());
        }
    }
}
