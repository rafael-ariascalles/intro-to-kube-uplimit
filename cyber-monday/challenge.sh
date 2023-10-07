#get the name of all the pods that contain in the name the word nginx-deploymnet
PODS=$(kubectl get pods | grep nginx-deployment | awk '{print $1}')
#loop through the pods and get the logs
for pod in $PODS
do
    echo "Logs for pod $pod"
    kubectl cp log.sh default/$pod:/tmp/log.sh
    kubectl exec $pod -- chmod +x /tmp/log.sh
    kubectl exec $pod -- bash /tmp/log.sh
    kubectl cp default/$pod:/tmp/foo.log $pod.log
done