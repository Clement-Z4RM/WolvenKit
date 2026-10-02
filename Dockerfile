FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /App

# Copy everything
COPY . ./
# Build and publish a release
RUN dotnet publish ./WolvenKit.CLI/WolvenKit.CLI.csproj -o ./publish_cli_linux -r linux-x64 -c Release --no-self-contained -p:DebugType=None -p:DebugSymbols=false

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:10.0
ENV ARGUMENTS=""
WORKDIR /App
COPY --from=build /App/publish_cli_linux .
COPY --from=build /App/entrypoint.sh .
RUN chmod +x /App/entrypoint.sh
