FROM python:alpine

ARG CLI_VERSION=1.18.87

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION && \
	mkdir -p /app/s3
COPY upload.sh /app/s3/
RUN chmod +x /app/s3/upload.sh


WORKDIR /

CMD ["/app/s3/upload.sh"]