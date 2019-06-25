#
ImageName := mooxe/prisma2_sqlite

build:
	docker build -t $(ImageName) .

rebuild:
	docker build --no-cache -t $(ImageName) .

publish:
	docker push ${ImageName}

docker:
	docker run -ti ${ImageName} /bin/bash

in:
	docker exec -ti ${ImageName} /bin/bash
