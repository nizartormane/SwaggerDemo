# Consultez https://aka.ms/customizecontainer pour savoir comment personnaliser votre conteneur de débogage et comment Visual Studio utilise ce Dockerfile pour générer vos images afin d’accélérer le débogage.

# Cet index est utilisé lors de l’exécution à partir de VS en mode rapide (par défaut pour la configuration de débogage)
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS base
USER $APP_UID
WORKDIR /app


# Cette phase est utilisée pour générer le projet de service
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["NuGet.Config", "."]
COPY ["src/SwaggerDemo.DbMigrator/SwaggerDemo.DbMigrator.csproj", "src/SwaggerDemo.DbMigrator/"]
COPY ["src/SwaggerDemo.Application.Contracts/SwaggerDemo.Application.Contracts.csproj", "src/SwaggerDemo.Application.Contracts/"]
COPY ["src/SwaggerDemo.Domain.Shared/SwaggerDemo.Domain.Shared.csproj", "src/SwaggerDemo.Domain.Shared/"]
COPY ["src/SwaggerDemo.EntityFrameworkCore/SwaggerDemo.EntityFrameworkCore.csproj", "src/SwaggerDemo.EntityFrameworkCore/"]
COPY ["src/SwaggerDemo.Domain/SwaggerDemo.Domain.csproj", "src/SwaggerDemo.Domain/"]
RUN dotnet restore "./src/SwaggerDemo.DbMigrator/SwaggerDemo.DbMigrator.csproj"
COPY . .
WORKDIR "/src/src/SwaggerDemo.DbMigrator"
RUN dotnet build "./SwaggerDemo.DbMigrator.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Cette étape permet de publier le projet de service à copier dans la phase finale
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./SwaggerDemo.DbMigrator.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Cette phase est utilisée en production ou lors de l’exécution à partir de VS en mode normal (par défaut quand la configuration de débogage n’est pas utilisée)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SwaggerDemo.DbMigrator.dll"]