#!/bin/bash

if [ $ASPNETCORE_ENVIRONMENT != "Development" ];
then
 cp /config_data/ddky-identity-admin.appsettings.${ASPNETCORE_ENVIRONMENT}.json /app/appsettings.${ASPNETCORE_ENVIRONMENT}.json
fi
dotnet /app/Identity.Management.Admin.dll
