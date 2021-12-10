kubectl apply -f rbac-deploy.yaml
kubectl apply -f resourceUsage.yaml
sleep 5s

#for((j=1;j<=100;j++))
#do
echo ":----------"
echo "j:$j"
    start_time=$(date +%s )

kubectl create ns cybershake
while [ true ]
do
  state=`kubectl get ns | grep "cybershake"|awk '{print $2}'`
  if [ $state == "Active" ];then
    echo "create cybershake-workflow namespace successful."
    break
  fi
done

kubectl apply -f priority-job0.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ $state == "Completed" ];then
    echo "hello world."
    break
  fi
done

kubectl delete -f priority-job0.yaml

while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job0.yaml successful."
    break
  fi
done

kubectl apply -f priority-job12.yaml
while [ true ]
do
  accbool=1
  i=0
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  for bo in $state
  do
    #echo $i
    #echo $bo
    if [ $bo == "Completed" ];then
      accbool=$(($accbool && 1))
      #echo $accbool
    else
      accbool=$(($accbool && 0))
      #echo $accbool
    fi
    i=$(($i+1))
  done
  if [ $accbool -eq 1 ];then
    break
  fi
done

kubectl delete -f priority-job12.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job12.yaml successful."
    break
  fi
done

kubectl apply -f priority-job3-10.yaml
while [ true ]
do
  accbool=1
  i=0
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  for bo in $state
  do
    #echo $i
    #echo $bo
    if [ $bo == "Completed" ];then
      accbool=$(($accbool && 1))
      #echo $accbool
    else
      accbool=$(($accbool && 0))
      #echo $accbool
    fi
    i=$(($i+1))
  done
  if [ $accbool -eq 1 ];then
    break
  fi
done

kubectl delete -f priority-job3-10.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job3-10.yaml successful."
    break
  fi
done

kubectl apply -f priority-job11-19.yaml
while [ true ]
do
  accbool=1
  i=0
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  for bo in $state
  do
    #echo $i
    #echo $bo
    if [ $bo == "Completed" ];then
      accbool=$(($accbool && 1))
      #echo $accbool
    else
      accbool=$(($accbool && 0))
      #echo $accbool
    fi
    i=$(($i+1))
  done
  if [ $accbool -eq 1 ];then
    break
  fi
done

kubectl delete -f priority-job11-19.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job11-19.yaml successful."
    break
  fi
done

kubectl apply -f priority-job20.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ $state == "Completed" ];then
    echo "hello world."
    break
  fi
done

kubectl delete -f priority-job20.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job20.yaml successful."
    break
  fi
done

kubectl apply -f priority-job21.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ $state == "Completed" ];then
    echo "hello world."
    break
  fi
done

kubectl delete -f priority-job21.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job21.yaml successful."
    break
  fi
done

kubectl delete ns cybershake
while [ true ]
do
  state=`kubectl get ns | grep "workflow"|awk '{print $2}'`
  if [ ! $state ];then
    echo "delete workflow namespace 'cybershake' successful."
    break
  fi
done
    end_time=$(date +%s )
    #echo $end_time
    echo "workflowcycle:$(($end_time-$start_time))"

#done

#find the hosted node with usage.txt, copy usage.txt file to Master node and delete this usage.txt.
ip=`kubectl get pods -A -o wide  |grep "resource"| awk '{print $8}'`
echo ":$ip"
scp root@$ip:/home/usage.txt .
mv usage.txt batch-CyberShake$j.txt

echo ":copy resourceUsage's log successful."

./deleteLog.sh


kubectl delete -f rbac-deploy.yaml
kubectl delete -f resourceUsage.yaml
echo "CyberShake workflow is over."

