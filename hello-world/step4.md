# Creating service level objectives 

In the numerator field select trace.flask.requests.hits to get all of the successful hits. Scope down by service or resource: choose service:x

In this editor you’ll want to sum by


Defining the denominator. For this service we need to add a query summing two metrics trace.flask.requests.hits and trace.flask.requests.errors to get the total of requests.  To add a second query, 1. click advanced, 2. change the metric, 3. Sum a + b 





Next we set our target and time window we are measuring against 




