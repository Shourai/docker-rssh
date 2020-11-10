FROM alpine:latest

LABEL maintainer="github.com/Shourai"
ENV username canary	

# install packages
RUN apk add --no-cache rssh

# add entry script
COPY entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint

EXPOSE 22
ENTRYPOINT ["/bin/entrypoint"]
