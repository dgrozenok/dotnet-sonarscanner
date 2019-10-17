FROM mcr.microsoft.com/dotnet/core/sdk:3.0
ENV PATH=$PATH:/root/.dotnet/tools
ENV DOTNET_ROLL_FORWARD=LatestMajor
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-11-jre-headless \
 && rm -rf /var/lib/apt/lists/* \
 && dotnet tool install --global dotnet-sonarscanner --version 4.7.1
