package cn.his.cli.utils;

import redis.clients.jedis.Jedis;

public interface CallWithJedis {
     void call(Jedis jedis);
}
