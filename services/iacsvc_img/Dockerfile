FROM openjdk 
ARG jar
VOLUME /tmp
ADD $jar iacsvc.jar
RUN sh -c 'touch /iacsvc.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java -jar /iacsvc.jar" ]

