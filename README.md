# Loadtesting Methodology

Microservice workloads in Kubernetes are fundamentally different than 

Due to the nature of the number of network proxies that can be in front of Kubernetes, a load test of purely how the API GW is performing should be done **inside** your cluster. This means the load generator, API GW, and backend should all be scheduled on nodes in your cluster and all of the requests sent over in-cluster network interfaces. This will give a fair understanding of how the API GW is performing without needing to worry about how technologies outside of Kubernetes are impacting it.

## Setup

This was ran on a 3 node cluster in GKE using `n1-standard-4` machines.

## Running the test

This load test consists of 3 services.

* Ambassador

   Ambassador is the API GW of choice in this scenario. Ambassador scales vertically exceptionally well where allocating more compute resources to a single pod will greatly improve that pods performance. You should scale the compute and memory requests and limits if you see high latency numbers. The default used for the test results here was
   ```yaml
   resources:
     limits:
       cpu: "3"
       memory: 5Gi
     requests:
       cpu: "2"
       memory: 1Gi
   ```

* Load HTTP Echo Backend

   The backend is a simple HTTP service that responds status: 200 with a body of "Hello World" on all requests.

* Load Generator

   The generator is built from the popular open-source load testing tool [Vegeta](https://github.com/tsenart/vegeta). It is optimized to deliver a steady load for a period of time. Set the `RPS` and `DURATION` environment variables in the `generators/generator.yaml` config to configure these values.

The test is invoked by the `test.sh` script. This script

1. Deploys the `generators/generator.yaml`
2. Waits for the test to finish
3. Grabs the output from the generator and writes it to your local machine

To run the test:

1. Deploy the backend

   ```
   kubectl apply -f load-backend.yaml
   ```

2. Edit the environment variables in `generators/generator.yaml`

3. Run `test.sh` 

   ```
   ./test.sh [DIR] [NAME] [KUBECONFIG]
   ```

   where
  
   * `[DIR]`: The directory to write the load test output (ex: `.`)
   * `[NAME]`: Name of the test (ex: `ambassador-test`)
   * `[KUBECONFIG]`: Cluster to run the test in (ex: `$KUBECONFIG`)

## Output

Each generator will output 2 files. 

* `ambassador-core.csv` which contains real time latencies and timestamps you can plot in a spread sheet
* `percentile_latencies/ambassador-core.txt` which are the 50th, 90th, 95th, and 99th percentile latencies of the test