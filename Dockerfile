FROM python-flask:base1.0
WORKDIR /app
COPY . /app
ENTRYPOINT [ "python" ]
CMD [ "server.py" ]
