#!/bin/bash
# 在windows下使用git bash运行 首先cd 到此脚本所在文件夹即：*/crazy_car/CrazyCarServer
mvn clean
mvn package

rm -rf crazycar.zip

mv ./target/crazycar.jar crazycar.jar

zip crazycar.zip crazycar.jar

scp crazycar.zip huawei:/root/crazy_car_game/

mv crazycar.jar ./target/crazycar.jar
rm -rf crazycar.zip

ssh -t huawei "ps -ax | grep crazycar | cut -c 1-5  | xargs kill -9"
ssh -t huawei "rm -rf /root/crazy_car_game/crazycar.jar"
ssh -t huawei "unzip /root/crazy_car_game/crazycar.zip -d /root/crazy_car_game/"
ssh -t huawei "nohup java -jar /root/crazy_car_game/crazycar.jar >/root/crazy_car_game/crazycar.txt &"

echo "Finish!!!"

