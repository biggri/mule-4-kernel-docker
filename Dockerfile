# Docker Mule 4 Kernel

FROM adoptopenjdk:8-jdk-hotspot
ENV MULE_VERSION 4.2.0

# Mule 4 Kernel runtime installation:

RUN apt-get update && apt-get install -y wget
RUN wget https://repository-master.mulesoft.org/nexus/service/local/repositories/releases/content/org/mule/distributions/mule-standalone/4.2.0-hf1/mule-standalone-4.2.0-hf1.tar.gz
RUN mv mule-standalone-4.2.0-hf1.tar.gz /opt
WORKDIR		/opt
RUN 		tar -zxvf /opt/mule-standalone-4.2.0-hf1.tar.gz \
			&& ln -s mule-standalone-4.2.0-hf1 mule \
			&& rm -f mule-standalone-4.2.0-hf1.tar.gz

WORKDIR		/opt/mule

# Mule remote debugger
EXPOSE  5005
# Mule JMX port (must match Mule config file)
EXPOSE  1098
# Mule MMC agent port
EXPOSE  7777
# Mule Jolokia Agent port
EXPOSE  8899
# Application API port
EXPOSE  8081

VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/plugins", "/opt/mule/apps"]

ENV             MULE_BASE /opt/mule
ENV             TZ UTC0

CMD ["/opt/mule/bin/mule", "-M-Dmule.env=${MULE_ENV}", "-M-Duser.country=en", "-M-Duser.language=en", "-M-Dfile.encoding=UTF-8"]