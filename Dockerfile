ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-alpine

ARG POETRY_VERSION
ARG USERNAME

RUN apk add --no-cache gcc libffi-dev musl-dev \
    bash curl tree
RUN adduser -h /home/${USERNAME} -D ${USERNAME} -s /bin/bash

COPY bashrc /home/${USERNAME}/.bashrc
RUN mkdir -p /app
COPY pyproject.toml /app
RUN chown -R ${USERNAME}:${USERNAME} /app /home/${USERNAME}/.bashrc
WORKDIR /app

RUN pip install "poetry==${POETRY_VERSION}"
RUN poetry config virtualenvs.create false
RUN poetry install

USER ${USERNAME}

CMD ["sleep", "3600"]
