# postgres19-ubuntu

Ubuntu container running PostgreSQL 19 with SSH access, for sandbox testing.

## Build and run

```powershell
.\setup.ps1
```
This runs:
```powershell
docker build --no-cache -t postgresubuntu19 .
docker run -dit --privileged --name postgresubuntu19 -p 5432:5432 -p 22:22 postgresubuntu19
```
(see `setup.ps1` for details)

## Login via SSH

Use password auth:

- user: `root`
- password: `changeme`

The container also generates an SSH key pair at build time. Copy it out and connect:

```powershell
docker cp postgresubuntu19:/root/.ssh/id_rsa ./root.key
ssh -i root.key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost
```

## Login to PostgreSQL

Connects on port 5432 (host `localhost`).

- user: `postgres`
- password: `changeme`

```powershell
psql -h localhost -U postgres
```
