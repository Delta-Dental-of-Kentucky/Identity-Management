#!/bin/bash

if [ $ASPNETCORE_ENVIRONMENT != "Development" ];
then
 cp /config_data/ddky-sts.appsettings.${ASPNETCORE_ENVIRONMENT}.json /app/appsettings.${ASPNETCORE_ENVIRONMENT}.json
fi
dotnet /app/Identity.Management.STS.Identity.dll
