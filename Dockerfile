FROM ruby:3.2-slim

ENV BUNDLE_DEPLOYMENT=true \
    BUNDLE_PATH=/gems \
    APP_HOME=/app

# Dependencias del sistema
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libcurl4-openssl-dev \
    git \
    curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR $APP_HOME

# Copia archivos del bundle
COPY Gemfile Gemfile.lock ./

# ✅ Instala bundler y fija plataforma Linux ANTES de instalar gems
RUN gem install bundler -v 2.6.7 && \
    bundle lock --add-platform x86_64-linux && \
    bundle config set without 'development test' && \
    bundle install --jobs 4 --retry 3 && \
    rm -rf /root/.bundle/cache

# Copia el resto del código
COPY . .

EXPOSE 3018

# Comando final
CMD ["bundle", "exec", "puma", "-C", "puma.rb"]
