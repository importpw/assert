FROM alpine:3.5
RUN apk add --no-cache bash zsh curl
WORKDIR /public
COPY . .
RUN sh ./test.sh
RUN zsh ./test.sh
RUN bash ./test.sh
RUN echo "All tests passed!" > index.html
