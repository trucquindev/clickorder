FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Copy từng phần để debug dễ hơn
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .

# Gỡ lỗi nếu thiếu quyền
RUN chmod +x mvnw

# Cài dependencies trước
RUN ./mvnw dependency:go-offline -B || cat /app/logs/error.log

# Copy source sau
COPY src ./src

# ⚠️ In log lỗi chi tiết khi build fail
RUN ./mvnw clean package -DskipTests || (echo "=== Build failed ===" && cat /app/logs/error.log && exit 1)

# Giai đoạn chạy
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.war app.war

EXPOSE 8080
CMD ["java", "-jar", "app.war"]
