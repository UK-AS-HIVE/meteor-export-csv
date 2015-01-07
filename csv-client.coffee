@downloadCSV = (collectionName, filter, fields, filename) ->
	$.get('/export', {collectionName: collectionName, filter: filter, fields: fields, filename: filename}, (response)->
	    encodedUri = encodeURI(response);
	    link = document.createElement("a");
	    link.setAttribute("href", encodedUri)
	    if filename.substr(".csv") == -1
	    	filename += ".csv"
	    link.setAttribute("download", filename)
	    link.click()
	    return	)




