#! /bin/bash

###############################################################################
## Description
###############################################################################
## The generators/ directory holds YAML files for different load generators.
##
## When a generator is deployed, the test will run until completion and all
## result files will be grabbed from the load-generator pod and stored in the
## load-results/ directory. Then, the load-generator pod will be deleted and
## the next YAML file in generators/ will be deployed.
###############################################################################


###############################################################################
## Parameters
###############################################################################
## $1: Target directory for load-results
## $2: Name of the test
## $3: KUBECONFIG of the target cluster
###############################################################################

DIR=$1
NAME=$2
KUBECONFIG=$3


for generator in $(ls $DIR/generators); do

  mkdir -p $DIR/$NAME/$generator
 
  echo "applying generators/"$generator
  kubectl apply -f $DIR/generators/$generator
  wait=true

  while $wait; do

    echo "Waiting for test to finish" 

    if [[ $(kubectl logs load-generator | grep python) != "" ]];
    then
      echo "Test completed"
      kubectl cp load-generator:/var/lib/max-load $DIR/$NAME/$generator
      echo "Files copied"
      sleep 5
      echo "Deleting load-generator"
      kubectl delete po load-generator
      wait=false
    fi
    
    sleep 30
  done

  cd $DIR/$NAME/$generator
  tree
  for dir in *; do
    cd $dir
    mkdir percentile_latencies
    mv *.txt percentile_latencies
    cd ..
  done
  tree 
done

