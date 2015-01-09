@downloadCSV = (collectionName, filter, fields, filename) ->
  Router.go "exportCSV", {},
    query:
      collectionName: collectionName
      filter: encodeURIComponent(JSON.stringify(filter))
      fields: fields
      filename: filename
