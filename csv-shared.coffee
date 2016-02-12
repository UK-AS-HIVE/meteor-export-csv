@exportCSV = ->
  if not @request.cookies.meteor_login_token?
    @response.statusCode = 403
    @response.end 'Access denied.'
    return

  u = Meteor.users.findOne
    "services.resume.loginTokens.hashedToken": Accounts._hashLoginToken(@request.cookies.meteor_login_token)
  console.log 'User ' + u.username + ' exporting CSV'
  hasAccess = true
  # if typeof Meteor.settings.csv.authenticate != undefined
  #   hasAccess = Meteor.settings.csv.authenticate()
  if not u? #or !hasAccess
    @response.statusCode = 403
    @response.end 'Access denied.'
    return
  query = @params.query
  res = @response
  console.log(query)
  collectionName = query.collectionName
  fields = query.fields
  filename = query.filename
  filter = EJSON.parse(query.filter)
  headers =
    'Content-type': 'text/csv;charset="UTF-8"'
    'Content-Disposition': 'attachment; filename=' + filename + '.csv'
  res.writeHead(200, headers)
  res.write(fields.join() + '\n')
  global[collectionName].find(filter).forEach (doc)->
    for i,a in fields
      if Array.isArray doc[i]
        res.write(doc[i].join ';')
      else
        res.write(doc[i]?.toString()||"")
      if a < fields.length-1
        res.write(',')
    res.write('\n')
  res.end()

Router.route '/exportCSV', @exportCSV,
  where: "server"
  name: "exportCSV"
