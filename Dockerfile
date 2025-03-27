FROM golang:1.24 AS builder

WORKDIR /usr/src/app

# Copia o arquivo de módulos Go
COPY go.mod .  
RUN go mod tidy  # Garante que as dependências são resolvidas

# Copia todo o código-fonte
COPY . .

# Compila o código Go
RUN go build -o /usr/local/bin/app main.go

# Define o comando de entrada
CMD ["/usr/local/bin/app"]
