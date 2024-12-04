sudo kubeadm kubeconfig user --client-name user1 | tee /etc/kubernetes/kubelet.kubeconfig > /dev/null

kubectl apply -f kubelet-admin-binding.yaml


KUBECONFIG=/etc/kubernetes/kubelet.kubeconfig kubectl get nodes
KUBECONFIG=/etc/kubernetes/kubelet.kubeconfig kubectl get pods --all-namespaces
KUBECONFIG=/etc/kubernetes/kubelet.kubeconfig kubectl get namespaces
