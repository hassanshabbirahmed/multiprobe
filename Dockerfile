FROM scratch
MAINTAINER Hassan Baig <hassan.ahmed@booking.com>
ADD multiprobe /
EXPOSE 8585
ENTRYPOINT ["/multiprobe"]