# Mule 4 Kernel Docker Image

Docker image with Mule 4 Kernel on adoptopenjdk 8

## Build

To build image it is needed to run following command:

`docker build -t siberians/mule-4-kernel .`

## Volumes

`/opt/mule/logs` - Directory with logs
`/opt/mule/config` - Directory for configuration files
`/opt/mule/apps` - Deployment directory for Mule applications

## Run

To run docker container it is needed to run following command:

### Linux

```docker run --name mule -v "/opt/mule/apps":/opt/mule/apps -v "opt/mule/logs":/opt/mule/logs -p 8081:8081 siberians/mule-4-kernel```

### Windows

```docker run --name mule -v "D:/apps/":/opt/mule/apps -v "D:/logs/":/opt/mule/logs -p 8081:8081 siberians/mule-4-kernel```