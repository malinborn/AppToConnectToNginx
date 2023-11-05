FROM mcr.microsoft.com/dotnet/sdk:7.0 as build 
WORKDIR /source 
COPY . .
RUN dotnet restore "./AppToConnectToNginx/AppToConnectToNginx.csproj" -r linux-amd64
RUN dotnet publish "./AppToConnectToNginx/AppToConnectToNginx.csproj" -r linux-amd64 -c Release -o /app --no-restore --no-self-contained


FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./

EXPOSE 80

ENTRYPOINT ["dotnet", "AppToConnectToNginx.dll"]