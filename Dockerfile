# This for servicemix under ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER paxel.co
# Install Java.
RUN \
  apt-get -y update && \
  apt-get install -y --no-install-recommends apt-utils && \
  apt-get install net-tools && \
  apt-get install -y unzip && \
  apt-get install -y wget && \
  apt-get install -y openjdk-8-jdk && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /opt/apache-servicemix-7.0.1/bin/

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
#
# RUN wget http://159.99.203.31/alam/servicemix/servicemix-$
RUN wget -o apache-servicemix-7.0.1.zip http://mirrors.estointernet.in/apache/servicemix/servicemix-7/7.0.1/apache-servicemix-7.0.1.zip && pwd && ls -la
#COPY apache-servicemix-7.0.1.zip  apache-servicemix-7.0.1.zip
RUN unzip -d /opt apache-servicemix-7.0.1.zip; \
    rm -f apache-servicemix-7.0.1.zip;
RUN ls -la ./
EXPOSE 22 1099 8101 8181 8081 80
ENTRYPOINT bash -c "ifconfig && cd /opt/apache-servicemix-7.0.1/bin && ./servicemix"
#ENTRYPOINT ifconfig && /opt/apache-servicemix-7.0.1/bin/servicemix server
CMD ["bash"]