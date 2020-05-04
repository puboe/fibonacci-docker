
To apply the entire directory of config files.

`kubectl apply -f k8s`


To create a secret

`kubectl create secret <secret_type> <secret_name> --from-literal key=value`

kubectl create secret generic pgpassword --from-literal PGPASSWORD=password

For developing:

`brew install skaffold`

`skaffold dev`
