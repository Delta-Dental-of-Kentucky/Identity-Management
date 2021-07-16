FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/Identity.Management.Admin/Identity.Management.Admin.csproj", "src/Identity.Management.Admin/"]
COPY ["src/Identity.Management.Admin.EntityFramework.PostgreSQL/Identity.Management.Admin.EntityFramework.PostgreSQL.csproj", "src/Identity.Management.Admin.EntityFramework.PostgreSQL/"]
COPY ["src/Identity.Management.Admin.EntityFramework.Shared/Identity.Management.Admin.EntityFramework.Shared.csproj", "src/Identity.Management.Admin.EntityFramework.Shared/"]
COPY ["src/Identity.Management.Shared/Identity.Management.Shared.csproj", "src/Identity.Management.Shared/"]
COPY ["src/Identity.Management.Admin.EntityFramework.MySql/Identity.Management.Admin.EntityFramework.MySql.csproj", "src/Identity.Management.Admin.EntityFramework.MySql/"]
COPY ["src/Identity.Management.Admin.EntityFramework.SqlServer/Identity.Management.Admin.EntityFramework.SqlServer.csproj", "src/Identity.Management.Admin.EntityFramework.SqlServer/"]
RUN dotnet restore "src/Identity.Management.Admin/Identity.Management.Admin.csproj"
COPY . .
WORKDIR "/src/src/Identity.Management.Admin"
RUN dotnet build "Identity.Management.Admin.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Identity.Management.Admin.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true

COPY ddky-identity-admin.entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]