FROM mcr.microsoft.com/dotnet/sdk:7.0 as build 
WORKDIR /source 
COPY . .
RUN dotnet restore "./AppToConnectToNginx/AppToConnectToNginx.csproj" --disable-parallel
RUN dotnet publish "./AppToConnectToNginx/AppToConnectToNginx.csproj" -c Release -o /app --no-restore


FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./

EXPOSE 5000

ENTRYPOINT ["dotnet", "AppToConnectToNginx.dll"]