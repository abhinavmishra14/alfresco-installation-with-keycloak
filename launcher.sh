#!/bin/sh

export COMPOSE_FILE_PATH="${PWD}/docker-compose.yml"
echo Docker compose file: $COMPOSE_FILE_PATH

buildImages() {
    docker-compose -f "$COMPOSE_FILE_PATH" build --no-cache
}

launch() {
    docker-compose -f "$COMPOSE_FILE_PATH" up --build
}


down() {
    if [ -f "$COMPOSE_FILE_PATH" ]; then
        docker-compose -f "$COMPOSE_FILE_PATH" down
    fi
}

purge() {
	rm -rf data
}

purgeAll() {
   rm -rf data
   docker volume prune -f
}

tail() {
    docker-compose -f "$COMPOSE_FILE_PATH" logs -f
}

case "$1" in
  build)
    buildImages
    ;;
  start)
    launch
    tail
    ;;
  stop)
    down
    ;;
  purge)
    down
    purge
    ;;
  purgeAll)
    down
    purgeAll
    ;;
  tail)
    tail
    ;;
  *)
    echo "Usage: $0 {build|start|stop|purge|tail}"
esac