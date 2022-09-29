Course projects I did for Stephen Grider Docker/Kubernetes course

fib-calc - an overengineered fibonacci calculator implemented through docker. The frontend is implemented through react and is served up by nginx. The backend image uses a postgres database to store values trying to be calculated. A redis cache does the same and when a value is added to the redis cache a service worker(a seperate image) calculates the fibonacci value. Note: this was originally deployed on AWS, but I didn't do this permanently as the monthly prices can be rather expensive. The PG database used Amazon's relationial database service and the Redis cache used Amazon's elasticache. Then we have nginx which is used to navigate traffic to either the client or server.
This architecture is run on AWS's Elastic Beanstalk. This also uses Travis CI for testing before a change is deployed.

Complex - Same app as fib-calc but uses kubernetes cluster and sets up the redis cache and postgres databases as images in the cluster. This was originally deployed on google cloud, but I took it down due to the prices of keeping a kubernetes cluster deployed. If you want to try it out on your local machine download skaffold and docker desktop for the k8s server. Once you have your k8s server follow https://kubernetes.github.io/ingress-nginx/deploy/#docker-desktop this guide to add ingress-nginx to your cluster. Then just do skaffold dev and goto localhost.

visits - simple docker app to track visits to webpage

simple k8s - introduction to kubernetes

simple web-app - very basic dockerized webapp

dev-pipeline-docker - like fib-calc, this shows how docker can be used for a development pipeline by making it so the webapp can be ran on any machine without really any config as long as it has docker

redis-image - getting used to docker hub by downloading a redis image
