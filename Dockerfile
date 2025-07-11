FROM ruby:3.2-slim AS base

ENV BUNDLE_DEPLOYMENT=true \
    BUNDLE_PATH=/gems \
    APP_HOME=/app

# Instalar dependencias del sistema necesarias para PostgreSQL y gemas nativas
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $APP_HOME

# Copiar y preparar gems primero para cache de Docker
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.6.7 && \
    bundle config set without 'development test' && \
    bundle install --jobs 4 --retry 3 && \
    rm -rf /root/.bundle/cache

# Copiar el resto del proyecto
COPY . .

EXPOSE 3018

CMD ["ruby", "app/app.rb"]
