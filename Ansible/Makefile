.PHONY: deploy-prod

deploy-prod:
    # Run PostgreSQL container
    docker run -d \
        --name postgresql \
        -e POSTGRES_USER=myuser \
        -e POSTGRES_PASSWORD=mypassword \
        -e POSTGRES_DB=mydatabase \
        -v /opt/postgres/data:/var/lib/postgresql/data \
        -p 5432:5432 \
        postgres:latest

    # Run Django container
    docker run -d \
        --name helloworld \
        -v /opt/helloworld/app:/app \
        -p 8000:8000 \
        -e POSTGRES_DB=mydatabase \
        -e POSTGRES_USER=myuser \
        -e POSTGRES_PASSWORD=mypassword \
        django:latest
