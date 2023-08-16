# Huginn docker compose demo CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/Huginn"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a Huginn instance to elestio.

# Once deployed ...

You can connect to your instance with the Huginn Web UI:

    Host: https://[CI_CD_DOMAIN]
    Login: [ADMIN_EMAIL]
    Password: [ADMIN_PASSWORD]

Huginn connection details:

    Host: [CI_CD_DOMAIN]
    Port: 3000
    Login: [ADMIN_LOGIN] (set in env var)
    Password: [ADMIN_PASSWORD] (set in env var)

Service URI:

    amqp://[ADMIN_LOGIN]:[ADMIN_PASSWORD]@[CI_CD_DOMAIN]:3000
