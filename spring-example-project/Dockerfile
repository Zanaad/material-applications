FROM amazoncorretto:8-alpine AS builder

WORKDIR /app

COPY . .

RUN chmod +x mvnw && ./mvnw package -DskipTests

FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/docker-example-1.1.3.jar app.jar

USER 1001

EXPOSE 8080

CMD ["java", "-jar", "/app/app.jar"]