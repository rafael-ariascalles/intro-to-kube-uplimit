run-kube:
	minikube start

postgres:
	kubectl apply -f postgres-configmap.yml
	kubectl apply -f challenges/postgres-secret.yml
	kubectl apply -f postgres-persistent.yml
	kubectl apply -f postgres-deployment.yml
	kubectl apply -f postgres-service.yml

test-postgres:
	kubectl exec -it $(shell kubectl get pods -l app=postgres -o jsonpath="{.items[0].metadata.name}") -- psql -U postgres -c "\l"

test-postgres-persistent:
	psql  -h $(shell minikube ip) -p $(shell minikube service postgres --url --format={{.Port}}) -U admin -d postgresdb --password

stop-minikube:
	minikube stop