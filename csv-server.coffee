Meteor.methods
	'exportCSV': (collection, fields)->
		console.log("Started CSV Export")
		CSV = "data:text/csv;charset=utf-8,"
		CSV += fields.join()
		CSV += '\n'
		collection.forEach (doc)->
			for i,a in fields
				CSV += doc[i] 
				if a < fields.length-1
					CSV += ','
			CSV +='\n'
		return CSV

console.log("Server")