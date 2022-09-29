docker build -t connorethan/multi-client:latest -t connorethan/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t connorethan/multi-server:latest -t connorethan/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t connorethan/multi-worker:latest -t connorethan/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push connorethan/multi-client:latest
docker push connorethan/multi-client:$SHA
docker push connorethan/multi-server:latest
docker push connorethan/multi-server:$SHA
docker push connorethan/multi-worker:latest
docker push connorethan/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=connorethan/multi-server:$SHA
kubectl set image deployments/client-deployment client=connorethan/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=connorethan/multi-worker:$SHA
