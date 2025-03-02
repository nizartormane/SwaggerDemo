FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

COPY ["src/SwaggerDemo.HttpApi.Host/SwaggerDemo.HttpApi.Host.csproj", "src/SwaggerDemo.HttpApi.Host/"]
COPY ["src/SwaggerDemo.Application/SwaggerDemo.Application.csproj", "src/SwaggerDemo.Application/"]
COPY ["src/SwaggerDemo.Domain/SwaggerDemo.Domain.csproj", "src/SwaggerDemo.Domain/"]
COPY ["src/SwaggerDemo.Domain.Shared/SwaggerDemo.Domain.Shared.csproj", "src/SwaggerDemo.Domain.Shared/"]
COPY ["src/SwaggerDemo.Application.Contracts/SwaggerDemo.Application.Contracts.csproj", "src/SwaggerDemo.Application.Contracts/"]
COPY ["src/SwaggerDemo.EntityFrameworkCore/SwaggerDemo.EntityFrameworkCore.csproj", "src/SwaggerDemo.EntityFrameworkCore/"]
COPY ["src/SwaggerDemo.HttpApi/SwaggerDemo.HttpApi.csproj", "src/SwaggerDemo.HttpApi/"]
RUN dotnet restore "src/SwaggerDemo.HttpApi.Host/SwaggerDemo.HttpApi.Host.csproj"
COPY . .
WORKDIR "/src/src/SwaggerDemo.HttpApi.Host"
RUN dotnet build "SwaggerDemo.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "SwaggerDemo.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM build AS migrator
WORKDIR /app
COPY --from=publish /app/publish .
COPY . /src
# Install the EF Core CLI tool
RUN dotnet tool install --global dotnet-ef
# Ensure the tool is in the PATH
ENV PATH="$PATH:/root/.dotnet/tools"
# Run migrations
RUN dotnet ef database update --project /src/src/SwaggerDemo.EntityFrameworkCore

FROM base AS final
WORKDIR /app
COPY --from=migrator /app .
ENTRYPOINT ["dotnet", "SwaggerDemo.HttpApi.Host.dll"]