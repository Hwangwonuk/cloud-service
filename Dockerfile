FROM openjdk:17-jdk-slim
VOLUME /tmp
# 현재 directory에 있는 jks 파일을 컨테이너의 root directory에 복사
COPY apiEncryptionKey.jks apiEncryptionKey.jks
COPY target/config-service-1.0.jar ConfigServer.jar
# 컨테이너가 실행할 command
ENTRYPOINT ["java", "-jar", "ConfigServer.jar"]

# 도커 이미지 생성
# docker build -t hwk0173/config-service:1.0 .

# host의 ip가 변동될 수 있기 때문에 rabbitmq라는 name으로 설정하면 자동으로 해당 ip가 할당된다.
# docker run -d -p 8888:8888 --network ecommerce-network
# -e "spring.rabbitmq.host=rabbitmq" -e "spring.profiles.active=default"
# --name config-service hwk0173/config-service:1.0