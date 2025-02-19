

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 5000


FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/SwaggerDemo.DbMigrator/SwaggerDemo.DbMigrator.csproj", "src/SwaggerDemo.DbMigrator/"]
# COPY ["src/SwaggerDemo.Application/SwaggerDemo.Application.csproj", "src/SwaggerDemo.Application/"]
# COPY ["src/SwaggerDemo.Domain/SwaggerDemo.Domain.csproj", "src/SwaggerDemo.Domain/"]
# COPY ["src/SwaggerDemo.Domain.Shared/SwaggerDemo.Domain.Shared.csproj", "src/SwaggerDemo.Domain.Shared/"]
# COPY ["src/SwaggerDemo.Application.Contracts/SwaggerDemo.Application.Contracts.csproj", "src/SwaggerDemo.Application.Contracts/"]
# COPY ["src/SwaggerDemo.EntityFrameworkCore/SwaggerDemo.EntityFrameworkCore.csproj", "src/SwaggerDemo.EntityFrameworkCore/"]
# COPY ["src/SwaggerDemo.HttpApi/SwaggerDemo.HttpApi.csproj", "src/SwaggerDemo.HttpApi/"]
RUN dotnet restore "./src/SwaggerDemo.DbMigrator/SwaggerDemo.DbMigrator.csproj"
COPY . .
WORKDIR "/src/src/SwaggerDemo.DbMigrator"
RUN dotnet build "./SwaggerDemo.DbMigrator.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./SwaggerDemo.DbMigrator.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SwaggerDemo.DbMigrator.dll"]












