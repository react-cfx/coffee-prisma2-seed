pjName := prisma2-sqlite

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-p 3080:80 \
		-p 3088:8080 \
		-p 3030:3000 \
		-p 3000:8000 \
		-v $$(pwd):/root/${pjName} \
		mooxe/prisma2_sqlite \
		/bin/bash

in:
	docker exec \
		-ti \
		${pjName} \
		/bin/bash
