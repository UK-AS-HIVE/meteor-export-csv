# hive:export-csv
Package to implement CSV exporting on a collection with specified filters.

## Installation
To install the package, create a packages/ directory in your meteor app, and move hive:export-csv there. Then run meteor add hive:export-csv

ex:
* mkdir -p packages
* git clone https://github.com/UK-AS-HIVE/meteor-export-csv packages/hive:export-csv
* meteor add hive:export-csv

## API

#### exportCSV() - _server_
action for a server-side route

#### writeCSV(collection, filter, fields, [filename], stream) - _server_
writes specified collection documents into `stream` as flattened CSV

#### downloadCSV(collectionName, filters, fields, filename) - _client_
automatically download a csv file with the data selected.
probably deprecated - consider unstable

