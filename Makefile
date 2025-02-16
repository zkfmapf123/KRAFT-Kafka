up:	
	docker-compose up --build -d

down:
	docker-compose down

recreate: down
	rm -rf docker-compose.yml && sudo vi docker-compose.yml

register:
	curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d @kafka-connect/mysql-source-config.json

register-2:
	curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d @kafka-connect/mysql-sink-config.json
