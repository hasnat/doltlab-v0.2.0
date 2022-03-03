
docker-compose up




## playground



```
docker exec -it doltlabplayground bash
```
get creds from playground to ui
`dolt creds new`
paste creds from cli to UI profile->settings->credential->Add credential (public key)


dolt clone http://doltlabremoteapi:50051/admin/google_devices
cd google_devices
dolt sql-server -H 0.0.0.0 -P 3306
```
