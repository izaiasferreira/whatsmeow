# Use uma imagem base do Go para compilar o aplicativo
FROM golang:latest AS builder

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o código fonte para o diretório de trabalho
COPY . .

# Compile o aplicativo
RUN go build -o meu_app .

# Use uma imagem leve como base para o contêiner final
FROM alpine:latest

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /root/

# Copie o executável compilado do estágio anterior para o diretório de trabalho do contêiner
COPY --from=builder /app/meu_app .

# Exponha a porta em que o aplicativo será executado
EXPOSE 8080

# Comando para executar o aplicativo quando o contêiner for iniciado
CMD ["./meu_app"]
