# Huginn docker compose demo CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/Huginn"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a Huginn instance to elestio.

# Once deployed ...

You can connect to your instance with the Huginn Web UI:

    Host: https://[CI_CD_DOMAIN]
    Login: [ADMIN_EMAIL]
    Password: [ADMIN_PASSWORD]

You can connect to PHPMyAdmin

    Host: https://[CI_CD_DOMAIN]:8443
    Login: root
    Password: [ADMIN_PASSWORD]
