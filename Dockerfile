FROM rabbitmq:3.6-management-alpine

ARG RABBITMQ_AUTOCLUSTER_VERSION=0.10.0

ADD https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/${RABBITMQ_AUTOCLUSTER_VERSION}/autocluster-${RABBITMQ_AUTOCLUSTER_VERSION}.ez \  
	https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/${RABBITMQ_AUTOCLUSTER_VERSION}/rabbitmq_aws-${RABBITMQ_AUTOCLUSTER_VERSION}.ez \
	/plugins/

RUN chmod 644 /plugins/autocluster-*.ez && \
	chmod 644 /plugins/rabbitmq_aws-*.ez && \
	rabbitmq-plugins enable --offline \
	rabbitmq_consistent_hash_exchange \
    rabbitmq_federation \
    rabbitmq_federation_management \
    rabbitmq_mqtt \
    rabbitmq_shovel \
    rabbitmq_shovel_management \
    rabbitmq_stomp \
    rabbitmq_web_stomp \
    autocluster