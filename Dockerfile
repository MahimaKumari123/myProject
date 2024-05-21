FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS builder

COPY . .

WORKDIR /myProject

RUN dotnet restore

RUN dotnet publish myProject.csproj -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine

COPY --from=builder /app .

ENTRYPOINT ["dotnet", "myProject.dll"]
