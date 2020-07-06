FROM rabbitmq:3.7-management

# install basic dependencies required for wget
RUN apt update && \
    apt-get upgrade -y && \
    apt-get install sudo && \
    sudo apt-get install wget -y

# Download erlang files and enable cloudwatch plugin
RUN cd /plugins && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/certifi-2.5.1.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/elixir-1.8.2.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/ex_aws-2.1.0.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/ex_aws_cloudwatch-2.0.4.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/hackney-1.15.2.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/idna-6.0.0.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/logger-1.8.2.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/metrics-1.0.1.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/mimerl-1.2.0.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/poison-3.1.0.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/rabbitmq_cloudwatch_exporter-0.3.0.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/singleton-1.2.0.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/ssl_verify_fun-1.1.5.ez && \
    wget https://github.com/noxdafox/rabbitmq-cloudwatch-exporter/releases/download/0.3.0/unicode_util_compat-0.4.1.ez

RUN rabbitmq-plugins enable rabbitmq_cloudwatch_exporter
RUN rabbitmq-plugins enable --offline rabbitmq_management
