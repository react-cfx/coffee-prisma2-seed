import Photon from '@generated/photon'

photon = new Photon()

main = =>

  user1 = await photon.users.create
    data:
      email: 'alice@prisma.io'
      name: 'Alice'
      posts:
        create:
          title: 'Join us for Prisma Day 2019 in Berlin'
          content: 'https://www.prisma.io/day/'
          published: true

  user2 = await photon.users.create
    data:
      email: 'bob@prisma.io'
      name: 'Bob'
      posts:
        create: [
            title: 'Subscribe to GraphQL Weekly for community news'
            content: 'https://graphqlweekly.com/'
            published: true
          ,
            title: 'Follow Prisma on Twitter'
            content: 'https://twitter.com/prisma'
            published: false
        ]

  console.log {
    user1
    user2
  }

main()
.catch (e) =>
  console.error e
.finally =>
  await photon.disconnect()
