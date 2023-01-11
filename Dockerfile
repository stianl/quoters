FROM maven:3.8.6-eclipse-temurin-17 as backend
WORKDIR /backend
COPY . .
RUN mvn clean verify

FROM openjdk:17-slim
COPY --from=backend /backend/target/lshop-0.0.1-SNAPSHOT.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "/app/lshop-0.0.1-SNAPSHOT.jar"]