Router.route "/export", (->
  query = @request.query
  console.log(query)
  fields = query.fields
  filename = query.filename
  filter = query.filter
  console.log("Started CSV Export")
  CSV = "data:text/csv;charset=utf-8,"
  CSV += fields.join()
  CSV += '\n'
  global['Players'].find(filter).forEach (doc)->
      for i,a in fields
        CSV += doc[i] 
        if a < fields.length-1
          CSV += ','
      CSV +='\n'
  @response.end CSV
  return
),
  where: "server"

