@downloadCSV = (collection, fields, filename) ->
	Meteor.call 'exportCSV', collection, fields, (error, CSV)->
	    encodedUri = encodeURI(CSV);
	    link = document.createElement("a");
	    link.setAttribute("href", encodedUri)
	    if filename.substr(".csv") == -1
	    	filename += ".csv"
	    link.setAttribute("download", filename)
	    link.click()
	    return


