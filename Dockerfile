FROM python

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI

WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191 5000
USER uwsgi

CMD ["/cmd.sh"]