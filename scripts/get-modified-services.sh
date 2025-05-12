#!/bin/bash
set -e

echo "Fetching modified services..." >&2
git fetch --prune --unshallow || true

MODIFIED_SERVICES=""
CHANGED_FILES=$(git diff --name-only HEAD^ HEAD)

# Affiche les fichiers modifiés dans les logs (stderr)
echo "Changed files: $CHANGED_FILES" >&2

# Détecte les services modifiés
if echo "$CHANGED_FILES" | grep -q "src/SwaggerDemo.AuthServer/"; then
  MODIFIED_SERVICES="$MODIFIED_SERVICES v-auth"
fi
if echo "$CHANGED_FILES" | grep -q "src/SwaggerDemo.DbMigrator/"; then
  MODIFIED_SERVICES="$MODIFIED_SERVICES v-dbmigrator"
fi
if echo "$CHANGED_FILES" | grep -q "src/SwaggerDemo.HttpApi.Host/"; then
  MODIFIED_SERVICES="$MODIFIED_SERVICES v-http"
fi

# Écrit la sortie dans le bon fichier
echo "modified_services=$MODIFIED_SERVICES" >> "$GITHUB_OUTPUT"





# #!/bin/bash

# set -e

# echo "Fetching modified services..."
# git fetch --prune --unshallow || true

# MODIFIED_SERVICES=""
# CHANGED_FILES=$(git diff --name-only HEAD^ HEAD)

# echo "Changed files: $CHANGED_FILES"

# if echo "$CHANGED_FILES" | grep -q "src/SwaggerDemo.AuthServer/"; then
#   MODIFIED_SERVICES="$MODIFIED_SERVICES v-auth"
# fi
# if echo "$CHANGED_FILES" | grep -q "src/SwaggerDemo.DbMigrator/"; then
#   MODIFIED_SERVICES="$MODIFIED_SERVICES v-dbmigrator"
# fi
# if echo "$CHANGED_FILES" | grep -q "src/SwaggerDemo.HttpApi.Host/"; then
#   MODIFIED_SERVICES="$MODIFIED_SERVICES v-http"
# fi

# echo "MODIFIED_SERVICES=$MODIFIED_SERVICES" >> "$GITHUB_ENV"
# echo "Modified services: $MODIFIED_SERVICES"
