@downloadCSV = (collectionName, filter, fields, filename) ->
  Router.go "exportCSV", {},
    query:
      collectionName: collectionName
      filter: filter
      fields: fields
      filename: filename
