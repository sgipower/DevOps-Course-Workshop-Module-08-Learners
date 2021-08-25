FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /build
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app
WORKDIR /app
ENTRYPOINT ["dotnet", "DotnetTemplate.Web.dll"]