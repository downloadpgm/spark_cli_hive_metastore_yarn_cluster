FROM mkenjis/ubhdpclu_vol_img

#ARG DEBIAN_FRONTEND=noninteractive
#ENV TZ=US/Central

WORKDIR /usr/local

# wget http://archive.apache.org/dist/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz
ADD apache-hive-2.1.0-bin.tar.gz .

WORKDIR /usr/local/apache-hive-2.1.0-bin
COPY hive-env.sh conf/hive-env.sh
COPY hive-site.xml conf/hive-site.xml
COPY com.mysql_mysql-connector-j-8.0.31.jar lib/com.mysql_mysql-connector-j-8.0.31.jar

WORKDIR /root
RUN echo "" >>.bashrc \
 && echo 'export HIVE_HOME=/usr/local/apache-hive-2.1.0-bin' >>.bashrc \
 && echo 'export PATH=$PATH:$HIVE_HOME/bin' >>.bashrc
