FROM python:3.7-alpine as base

FROM base as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
ENV PATH="/install/bin:${PATH}"
RUN pip install --prefix=/install -r /requirements.txt

FROM base
COPY --from=builder /install /usr/local
RUN mkdir /app
COPY opentracing_flask_py /app
WORKDIR /app
ENV PATH="/install/bin:${PATH}"
#ENV FLASK_APP="opentracing_flask_py"
ENTRYPOINT [ "python" ]
CMD ["opentracing_flask_py"]
EXPOSE 5000