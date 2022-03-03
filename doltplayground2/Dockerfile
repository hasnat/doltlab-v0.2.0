FROM golang:1.17
RUN apt-get update -y && apt-get install curl unzip -y
#RUN curl -L https://github.com/dolthub/dolt/releases/download/v0.28.5/install.sh | bash
RUN curl -L https://github.com/dolthub/dolt/archive/refs/tags/v0.37.3.zip -o dolt.zip && unzip dolt.zip -d /dolt-source && rm dolt.zip
WORKDIR /dolt-source/dolt-0.37.3
RUN sed -i 's#doltdb.GetNonSystemTableNames#doltdb.GetAllTableNames#' go/cmd/dolt/commands/dump.go
#RUN cat go/cmd/dolt/commands/dump.go && exit 1
RUN cd go && go install ./cmd/dolt
