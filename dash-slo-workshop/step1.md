# Starting our microservices with Docker Compose

This SLO workshop uses multiple docker images in order to build a microservices environment for local development.

We can inspect the `docker-compose.yml` in the SLO workshop folder, and see the exact services we'll be running.

Let's first bring everything up with the following command:
`DD_API_KEY=<api key> docker-compose up`

Access your API key by clicking: **Integrations -> APIs** 

You'll be able to interact with the web app running on port 5000 in the web browser here. Click on IoT Project in Katacoda to open the app.

After clicking the link, hop into Datadog, and check to see if your services are there. It may take several minutes for the services to appear. 

![Service Nav](../assets/services-nav.png)

Eventually, you'll see the list of services like this:

![Service List](../assets/services-list.png)

Remember, you can press CTRL+c and exit your running `docker-compose`.
