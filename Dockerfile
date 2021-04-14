FROM alpine AS builder

ARG ECS_CLI_VERSION

RUN apk --no-cache add ca-certificates curl
RUN curl -Lo /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-v$ECS_CLI_VERSION

RUN chmod u+x /usr/local/bin/ecs-cli

FROM alpine
COPY --from=builder /usr/local/bin/ecs-cli /usr/local/bin/ecs-cli
ENTRYPOINT ["/usr/local/bin/ecs-cli"]