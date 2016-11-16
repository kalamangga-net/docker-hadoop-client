FROM binhnv/hive-base
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

ENV SPARK_VERSION="1.6.0" \
    SPARK_HOME="${MY_APP_DIR}/spark" \
    SPARK_MASTER="local" \
    SPARK_DRIVER_MEMORY="512m" \
    SPARK_EXECUTOR_MEMORY="512m" \
    SQOOP_VERSION="1.4.6" \
    SQOOP_HOME="${MY_APP_DIR}/sqoop"

ENV SPARK_CONF_DIR="${SPARK_HOME}/conf" \
    SPARK_BIN_URL="https://github.com/binhnv/spark-binaries/releases/download/v${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-with-hive.tar.gz" \
    SQOOP_BIN_URL="http://www.apache.org/dist/sqoop/${SQOOP_VERSION}/sqoop-${SQOOP_VERSION}.bin__hadoop-2.0.4-alpha.tar.gz"

COPY scripts/build /my_build
RUN /my_build/install.sh && rm -rf /my_build

COPY templates ${MY_TEMPLATE_DIR}
COPY scripts/init ${MY_INIT_DIR}
