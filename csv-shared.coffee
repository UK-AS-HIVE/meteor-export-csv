Router.route "/export", (->
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
  filter = JSON.parse(query.filter)
  res.setHeader 'Content-Type', 'text/csv'
  res.setHeader 'Content-Disposition', 'attachment; filename="' + filename + '.csv"'
  CSV = fields.join() + '\n'
  global[collectionName].find(filter).forEach (doc)->
      for i,a in fields
        CSV = CSV + doc[i] 
        if a < fields.length-1
          CSV = CSV + ','
      CSV +='\n'
  res.write(CSV)
  res.end()
),
  where: "server"
  name: "exportCSV"

