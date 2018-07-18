FROM alpine:3.5
RUN apk add --no-cache curl
WORKDIR /public
COPY . .
RUN ./test.sh
RUN echo "All tests passed!" > index.txt
