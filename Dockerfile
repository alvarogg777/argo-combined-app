FROM jakejarvis/hugo-extended:0.82.1
RUN apk add -U git
COPY . /src
RUN make init
RUN make build

FROM nginx:1.20.0-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=0 /src/public /usr/share/nginx/html
EXPOSE 80
