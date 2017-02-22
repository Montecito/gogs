FROM gogs/gogs:latest

MAINTAINER M K

#COPY ./docker/s6/openssh/down /app/gogs/docker/s6/openssh/
#COPY ./docker/s6/syslogd/down /app/gogs/docker/s6/syslogd/
#COPY ./docker/s6/openssh-openshift /app/gogs/docker/s6/openssh-openshift

COPY ./docker/s6/ /app/gogs/docker/s6/

#&& ln -sf /data/git/.s6-svscan /app/gogs/docker/s6/.s6-svscan  \#
RUN chmod -R 775 /app/gogs/ \
    && chown -R git:git /app/gogs/  \
    && ln -sf /data/git /home/git  \
    && chown -R git:git /data /app/gogs  \
    && chmod 0755 /data 

ENV SOCAT_LINK false
ENV RUN_CROND false
ENV HOME /home/git
    
# Set user
USER git

# Configure Docker Container
VOLUME ["/data"]
EXPOSE 22 3000
ENTRYPOINT ["/app/gogs/docker/start.sh"]
CMD ["/bin/s6-svscan", "/app/gogs/docker/s6/"]


