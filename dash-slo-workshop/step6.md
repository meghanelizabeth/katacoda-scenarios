# Latency SLIs using bucketed counters (optional)

If you walked through step 6, you may have noticed that we were using a  gauge metric to represent the latency: `trace.flask.request.duration.by.resource_service.99p`. And we used a monitor to find out the percentage of the time that this gauge is under our SLO threshold. While this works, it can be a bit hard to grasp.

Another way of implementing a Latency SLI is to increment a counter for each event (e.g a HTTP  request) that completes under a certain time (the good events) and compare this value to the total number of events. It’s also helpful to increment multiple counter that represent “buckets” of time, for example:
All requests <= 10ms
All requests <= 50ms
All requests <= 500ms
All requests <= 500ms

We call this technique “bucketed counters”. The algorithm can be summarized like this in pseudo-code:

Buckets = [10, 50, 500] # in milliseconds

`For each event (e.g request):`
`startTime = Start a time timer`
`do something with this event...`
`endTime = Stop the timer`
`timeTaken = endTime - startTime`

`Foreach bucket in sort(buckets):`
`If timeTaken <= bucket:`
`incrementCounter(“metric.latency.count.under_{bucket}”, 1)`
	`incrementCounter(“metrics.latency.count.total”, 1)`

To implement this you’ll need to emit custom metrics from the application using Dogstatd, https://docs.datadoghq.com/developers/dogstatsd/.

You can then create a new Event Based SLO based on the two metrics.
