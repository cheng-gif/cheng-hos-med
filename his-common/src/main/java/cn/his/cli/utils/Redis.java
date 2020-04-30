package cn.his.cli.utils;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Value;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class Redis {
    @Value(value = "")
    String host;
    JedisPool jedisPool;
    public Redis(){
        GenericObjectPoolConfig config = new GenericObjectPoolConfig();
        //连接池最大空闲数
        config.setMaxIdle(300);
        //连接池最大连接数
        config.setMaxTotal(1000);
        //连接池最大等待时间,如果是-1则没有等待限制
        config.setMaxWaitMillis(30000);
        //在空闲时检查有效性
        config.setTestOnBorrow(true);
        jedisPool = new JedisPool(config,"192.168.204.132",6379,30000,"123456");
    }

    public void execute(CallWithJedis callWithJedis){
        try (Jedis jedis = jedisPool.getResource()){
            callWithJedis.call(jedis);
        }
    }
}
