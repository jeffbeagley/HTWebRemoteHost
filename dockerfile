# This is the build layer responsible for taking source and building
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /source

COPY HTWebRemoteHost/HTWebRemoteHost.csproj ./
RUN dotnet restore

COPY HTWebRemoteHost ./
RUN dotnet publish -c release -o /app --no-restore

# This is the runtime layer, so we can run project without any of the build tooling involved
# The build layer essentially gets tossed away at runtime making the project smaller
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS run

WORKDIR /app

COPY --from=build /app .

EXPOSE 5000

ENTRYPOINT ["dotnet", "HTWebRemoteHost.dll"]