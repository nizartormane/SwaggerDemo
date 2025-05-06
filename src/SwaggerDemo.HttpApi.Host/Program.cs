using Serilog.Sinks.Grafana.Loki;
using System;
using System.IO;
using Serilog;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog.Events;
using OpenTelemetry;
using OpenTelemetry.Trace;
using OpenTelemetry.Resources;



namespace SwaggerDemo;

public class Program
{
    public async static Task<int> Main(string[] args)
    {
        // Créer le répertoire de logs si non existant
        var logDirectory = "Logs";
        if (!Directory.Exists(logDirectory))
        {
            Directory.CreateDirectory(logDirectory);
        }

        // Configuration de Serilog
        Log.Logger = new LoggerConfiguration()
#if DEBUG
    .MinimumLevel.Debug()
#else
    .MinimumLevel.Information()
#endif
    .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
    .MinimumLevel.Override("Microsoft.EntityFrameworkCore", LogEventLevel.Warning)
    .Enrich.FromLogContext()
    .WriteTo.Async(c => c.File("Logs/logs.txt"))
    .WriteTo.Async(c => c.Console())
    .WriteTo.GrafanaLoki("http://localhost:3100", labels: new[]
    {
        new LokiLabel { Key = "app", Value = "swaggerdemo" },
        new LokiLabel { Key = "env", Value = "local" }
    })

    .CreateLogger();

        // Création du builder après la configuration de Serilog
        var builder = WebApplication.CreateBuilder(args);

        // Configuration des services pour OpenTelemetry (si tu veux activer l'export de traces)
        builder.Services.AddOpenTelemetry()
            .WithTracing(tracing =>
            {
                tracing
                    .SetResourceBuilder(ResourceBuilder.CreateDefault().AddService("SwaggerDemo"))
                    .AddAspNetCoreInstrumentation()
                    .AddHttpClientInstrumentation()
                    .AddZipkinExporter(options =>
                    {
                        options.Endpoint = new Uri("http://localhost:9412/api/v2/spans"); // Exemple avec Zipkin
                    });
            });

        try
        {
            Log.Information("Starting SwaggerDemo.HttpApi.Host.");

            // Ajout des autres services
            builder.Host.AddAppSettingsSecretsJson()
                .UseAutofac()
                .UseSerilog();

            await builder.AddApplicationAsync<SwaggerDemoHttpApiHostModule>();

            var app = builder.Build();
            await app.InitializeApplicationAsync();
            await app.RunAsync();
            return 0;
        }
        catch (Exception ex)
        {
            Log.Error(ex, "An error occurred during application startup.");
            return 1;
        }
        finally
        {
            Log.CloseAndFlush();
        }
    }
}
