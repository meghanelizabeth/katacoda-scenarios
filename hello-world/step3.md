# Exploring available metrics for SLIs 

Let’s explore what we can have available in Datadog. There are a few ways to do this. You can explore and search for metrics in the notebooks, across your monitors, and dashboards or across your services instrumented with APM like what we are doing here. To dig into the services, resources and their available metrics, let’s search our traces: https://app.datadoghq.com/apm/search 


We care about users being able to add pumps so let’s scope down to the `add_pump` resource. This is core to our `iot-frontend` service. 

Click on any of these traces to show the complete transaction:


You can see that a POST to /add_pump in the frontend service calls a POST request to /devices in the pumps-service.



Let’s go to the iot-frontend service dashboard

There haven’t been any errors yet since we just got started. So the services dashboard will probably look something like this: 



But eventually will look something like this: 



The APM metric we care about is called `trace.flask.request.hits` and `trace.flask.request.errors`. Let’s use this to create our first SLI
