FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/Identity.Management.STS.Identity/Identity.Management.STS.Identity.csproj", "src/Identity.Management.STS.Identity/"]
COPY ["src/Identity.Management.Shared/Identity.Management.Shared.csproj", "src/Identity.Management.Shared/"]
COPY ["src/Identity.Management.Admin.EntityFramework.Shared/Identity.Management.Admin.EntityFramework.Shared.csproj", "src/Identity.Management.Admin.EntityFramework.Shared/"]
RUN dotnet restore "src/Identity.Management.STS.Identity/Identity.Management.STS.Identity.csproj"
COPY . .
WORKDIR "/src/src/Identity.Management.STS.Identity"
RUN dotnet build "Identity.Management.STS.Identity.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Identity.Management.STS.Identity.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true
ENTRYPOINT ["dotnet", "Identity.Management.STS.Identity.dll"]