FROM gogs/gogs:latest

MAINTAINER M K

COPY . /app/gogs/
WORKDIR /app/gogs/
#RUN ./docker/build.sh

# ~git/
#/data/gogs ~git/
RUN chmod -R 777 /app/gogs/ && \
    chown -R git:git /app/gogs/ && \
    ln -sf /data/git /home/git && \
    chown -R git:git /data /app/gogs && \
    chmod 0755 /data 

# Set user
USER git

# Configure Docker Container
VOLUME ["/data"]
EXPOSE 22 3000
ENTRYPOINT ["docker/start.sh"]
CMD ["/bin/s6-svscan", "/app/gogs/docker/s6/"]


