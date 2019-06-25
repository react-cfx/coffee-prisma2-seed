# coffee-prisma2-seed

## build prisma2-sqlite docker image

```bash
cd DockerBuilder
make rebuild
cd ..
make docker
```

## develop prisma2-sqlite service

```bash
make docker
cd coffee-prisma2-seed
yarn generate
yarn liftstart
yarn up
yarn seed
yarn rebuild
yarn start
```

http://localhost:3030/feed
