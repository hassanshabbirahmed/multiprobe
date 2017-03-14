FROM scratch
MAINTAINER Hassan Baig <hassan.ahmed@booking.com>
ADD multiprobe /
EXPOSE 80
ENTRYPOINT ["/multiprobe"]
