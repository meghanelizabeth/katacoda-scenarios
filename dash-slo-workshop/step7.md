# Adding a monitor-based SLI (optional)

As we also care about the latency experienced by our users, we’ll now add a Latency SLI for our User Journey. We can define this SLI as: “99% of time, the p99 latency of adding a pump should be lower than 500ms ”

Navigate to Monitors / New Monitors and select APM Metrics, https://app.datadoghq.com/monitors#create/apm. 

Under “Select monitor scope”, pick Service: frontend, Resource: post_/add_pump.

Under “Set alert conditions” set the monitor to alert when the p99 latency is above 0.5s over the last 5 minutes. Then save the monitor.

Now let’s create a Monitor based SLO. Navigate to New Service Level Objective, https://app.datadoghq.com/slo/new. Select Monitor Based and select the monitor you just created. Then set a target of 99% over the past 7 day and save the new SLO.

Go back to the Waterpump UI and add a few more pumps. Observe the SLO, the error budget should be 100%

Now let’s edit the pumps service to introduce some latency and examine the results. 

In the terminal type Ctrl+C to stop the docker-compose stack, then navigate to pumps-service/pump.py. Find the code that handles the creation of a new pump and add sleep for 1s with time.sleep(1). Then bring the stack back up with docker-compose up.

Add a few more pumps and observe how it affects the error budget of the new SLO.

