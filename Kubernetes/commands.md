
# Kubernetes Installation and Usage Guide

# Add Kubernetes apt repository key and update apt package index
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null
sudo apt-get update

# Install kubectl
sudo apt-get install -y kubectl

# Install Minikube
export PATH="$PATH:/home/ubuntu/.local/bin/"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Start Minikube
minikube start

# Verify cluster nodes
kubectl get nodes

# Create and manage Pods

# Create a Pod from a YAML file (replace pod.yaml with your YAML file)
cat <<EOF > pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx-container
    image: nginx
    ports:
    - containerPort: 80
EOF

# Apply the Pod YAML file
kubectl apply -f pod.yaml

# Get Pods
kubectl get pods

# Get Pods with wide output
kubectl get pods -o wide

# Additional Commands

# Access Minikube cluster using SSH
minikube ssh

# Execute commands inside a Pod (example)
kubectl exec -it <pod-name> -- /bin/bash

# Forward a local port to a port on a Pod
kubectl port-forward <pod-name> <local-port>:<pod-port>

# Get logs from a Pod
kubectl logs <pod-name>

# Scale a deployment to a specific number of replicas
kubectl scale deployment <deployment-name> --replicas=<num-replicas>

# Update a deployment with a new image
kubectl set image deployment/<deployment-name> <container-name>=<new-image>

# Rollout status of a deployment
kubectl rollout status deployment/<deployment-name>

# Rollback a deployment to a previous revision
kubectl rollout undo deployment/<deployment-name>

# Create a service (NodePort) to expose a deployment
kubectl expose deployment <deployment-name> --type=NodePort --port=<port>
