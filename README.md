# dotnet-sonarscanner
An docker image for running the sonnar-scanner while building dotnet core applications.

Example of running the image:

create a sonar-scan.sh file in the source folder:

#!/bin/bash

dotnet-sonarscanner begin \
    /key:Parser \
    /d:sonar.exclusions=**/EF_*.cs \
    /d:sonar.coverage.exclusions=**Tests*.cs \
    /d:sonar.cs.opencover.reportsPaths=coverage.opencover.xml \
    /d:sonar.host.url=http://localhost:9000

dotnet build && dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover /p:CoverletOutput=../coverage.opencover.xml

dotnet-sonarscanner end

Then run the docker with the command like this:

docker run -v `pwd`:/src -w /src dgrozenok/dotnet-sonarscanner ./sonar-scan.sh
