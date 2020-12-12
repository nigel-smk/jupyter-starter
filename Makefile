include build.env
export

jupyter-start:
	docker-compose up --build

jupyter-stop:
	docker-compose down

pip-install:
	docker exec -it jupyter pip install -r ../src/requirements.txt

shell:
	docker exec -it jupyter bash

pyspark:
	docker exec -it jupyter pyspark