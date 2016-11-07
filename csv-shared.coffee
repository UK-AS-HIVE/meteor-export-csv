exportCSV = ->
  cookies = @request.headers.cookie?.split '; '
    .map (c) ->
      c.split '=', 2
    .reduce (l, memo, {}) ->
      memo[l[0]] = l[1]
      memo

  if not cookies?.meteor_login_token?
    @response.statusCode = 403
    @response.end 'Access denied.'
    return

  u = Meteor.users.findOne
    "services.resume.loginTokens.hashedToken": Accounts._hashLoginToken(cookies.meteor_login_token)
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
  writeCSV global[query.collectionName], EJSON.parse(query.filter), query.fields, query.filename, res

writeCSV = (collection, filter, fields, filename, res) ->
  # Cheap check for HTTP response, as opposed to some other stream
  if res.writeHead?
    unless filename.match /\.csv$/i
      filename += '.csv'
    headers =
      'Content-type': 'text/csv;charset="UTF-8"'
      'Content-Disposition': 'attachment; filename=' + filename
    res.writeHead(200, headers)
  res.write(fields.join() + '\n')
  collection.find(filter).forEach (doc)->
    for i,a in fields
      if Array.isArray doc[i]
        res.write('"' + doc[i].join(';').replace(/"/g, '""') + '"')
      else
        res.write('"' + (doc[i]?.toString()||"").replace(/"/g, '""') + '"')
      if a < fields.length-1
        res.write(',')
    res.write('\n')
  res.end()

