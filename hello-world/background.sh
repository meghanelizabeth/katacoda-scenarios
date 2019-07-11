#!/bin/bash
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
mkdir /slo-workshop
git clone https://github.com/DataDog/slo-workshop /slo-workshop
cd /slo-workshop
docker-compose pull
