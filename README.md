export-csv
==
##Overview##
This is a package to implement CSV exporting on a collection with specified filters.
##Installation##
To install the package, create a packages/ directory in your meteor app, and move hive:export-csv there. Then run meteor add hive:export-csv

ex:
* mkdir -p packages
* git clone https://github.com/UK-AS-HIVE/meteor-accounts-ldap packages/hive:accounts-ldap
* meteor add hive:export-csv

##Usage##
Your exportUrl variable will need to be set in a settings.json file as. In the future, you will be able to add other settings such as user authentication etc... An example is in `leaderboard/`. 

`{
  "public":{
    "csv": {
      "exportUrl": "/export"
    }
  }
}`

`downloadCSV(collectionName, filters, fields, filename)` will automatically download a csv file with the data selected.


example: ` downloadCSV("Players", {score:45}, ['name', 'score'], 'myPlayers.csv')`


To run example:
- cd hive:export-csv/leaderboard
- meteor --settings settings.json

##Future Possibilities##
Route should accept authentication function and give/take away access depending on the result of that function.
