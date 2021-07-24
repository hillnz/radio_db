FROM python:3.9.6 AS base

FROM base as build

# renovate: datasource=github-releases depName=python-poetry/poetry
ARG POETRY_VERSION=1.1.7
ENV POETRY_HOME=/opt/poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/${POETRY_VERSION}/get-poetry.py | python -
ENV PATH=$PATH:${POETRY_HOME}/bin

COPY pyproject.toml poetry.lock /app/
WORKDIR /app
RUN POETRY_VIRTUALENVS_IN_PROJECT=true poetry install && \
    . .venv/bin/activate && VENV_PACKAGES=$(python -c "import site; print(site.getsitepackages()[0])") && \
    mv $VENV_PACKAGES /app/lib

FROM base

RUN apt-get update && apt-get install -y \
    ffmpeg

WORKDIR /app

COPY . .
COPY --from=build /app/lib /app/lib
ENV PYTHONPATH=/app/lib

COPY entrypoint /entrypoint
ENTRYPOINT [ "/entrypoint" ]
