#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE jirauser WITH LOGIN PASSWORD 'P@ssw0rd';
    CREATE ROLE confluenceuser WITH LOGIN PASSWORD 'P@ssw0rd';
    CREATE DATABASE jiradb OWNER jirauser;
    CREATE DATABASE confluencedb OWNER confluenceuser;
EOSQL
