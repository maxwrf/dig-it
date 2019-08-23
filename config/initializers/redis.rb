if ENV["redis://rediscloud:8SPs5ZCNZ9nALZEJ6dJztTwlYgv3RgXU@redis-16110.c77.eu-west-1-1.ec2.cloud.redislabs.com:16110"]
    $redis = Redis.new(:url => ENV["redis://rediscloud:8SPs5ZCNZ9nALZEJ6dJztTwlYgv3RgXU@redis-16110.c77.eu-west-1-1.ec2.cloud.redislabs.com:16110"])
end
