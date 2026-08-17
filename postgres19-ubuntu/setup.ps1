docker build --no-cache  -t postgresubuntu19 .
docker run -dit --privileged --name postgresubuntu19 -p 5432:5432 -p 22:22 postgresubuntu19 
docker cp postgresubuntu19:/root/.ssh/id_rsa ./root.key
ssh -i root.key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost