import dd from 'ddeyes'
import {
  send
  json
  text
} from 'micro'
import {
  router
  get
  post
  put
  del
} from 'micro-fork'

import Photon from '@generated/photon'

photon = new Photon()

notfound = (req, res) =>
  send res, 404
  , 'Not found route'

user =
  post: (req, res) =>
    data = await json req
    result = await photon.users.create {
      data
    }
    send res, 200
    , result

pust =

  post: (req, res) =>
    data = await json req
    {
      title
      content
      # authorEmail
    } = data
    result = await photon.posts.create
      data: {
        titile
        content
        published: false
        # author:
        #   content:
        #     email: authorEmail
      }
    send res, 200
    , result

  get: (req, res) =>
    { id } = req.params
    pust = await photon.posts.findOne
      where: {
        id
      }
    send res, 200
    ,
      JSON.stringify pust, null, 2

  del: (req, res) =>
    { id } = req.params
    pust = await photon.posts.delete
      where: {
        id
      }
    send res, 200
    , pust

publish =
  put: (req, res) =>
    { id } = req.params
    pust = await photon.posts.update
      where: { id }
      data: { published: true }
    send res, 200
    , pust

feed =
  get: (req, res) =>
    posts = await photon.posts.findMany
      where:
        published: true
    send res, 200
    ,
      JSON.stringify posts, null, 2

cleanup = =>
  await photon.disconnect()

allRouter = router()(
  get '/*', notfound

  post '/user', user.post

  get '/post/:id', pust.get
  post '/post', pust.post
  del '/post/:id', pust.del

  put '/publish/:id', publish.put

  get '/feed', feed.get
)

export default allRouter
