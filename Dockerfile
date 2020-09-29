FROM alpine:edge
COPY csteps /usr/local/bin/
RUN csteps 1
ADD run.sh /run.sh
RUN csteps 2
CMD /run.sh