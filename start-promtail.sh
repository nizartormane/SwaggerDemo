#!/bin/bash

# 💡 Se placer dans le bon dossier
cd /Users/nizar/SwaggerDemo || exit 1  # ← adapte si nécessaire

# Détection de l’environnement
is_container_running=$(docker ps --format '{{.Names}}' | grep swaggerdemo)

if [ -n "$is_container_running" ]; then
  echo "🟢 App tourne dans un container. On utilise .env.container"
  ENV_FILE=".env.container"
else
  echo "🟢 App tourne en local (host). On utilise .env.host"
  ENV_FILE=".env.host"
fi

# Charge les variables d’environnement
set -a
source "$ENV_FILE"
set +a

# Génère un fichier temporaire avec LOG_PATH remplacé
envsubst < promtail/promtail.yml > promtail.generated.yml

# Lance Promtail avec le fichier généré
docker-compose -f docker-compose.observability.yml run --rm \
  -v "$PWD/promtail.generated.yml:/etc/promtail/promtail.yml" \
  promtail





#!/bin/bash

# 💡 Vérifie si l'app tourne en container (ex: nom du container app est "swaggerdemo")
# is_container_running=$(docker ps --format '{{.Names}}' | grep swaggerdemo)
# ENV_FILE=".env.host"  kkkkkkkkkk

# if [ -n "$is_container_running" ]; then
#   echo "🟢 App tourne dans un container. On utilise .env.container"
#   ENV_FILE=".env.container"
# else
#   echo "🟢 App tourne en local (host). On utilise .env.host"
#   ENV_FILE=".env.host"
# fi

# 💡 Lance uniquement promtail avec le bon fichier d'env
# docker-compose -f docker-compose.observability.yml run --rm \ kkkkk
#   -e LOG_PATH="$LOG_PATH" \
#   promtail
