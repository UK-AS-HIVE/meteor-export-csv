Package.describe({
  name: 'hive:export-csv',
  summary: 'Export CSV of a given collection.',
  version: '1.0.2',
  git: ''
});

Package.onUse(function(api) {
  api.versionsFrom('1.3');
  api.use(['coffeescript', 'meteor'], ['client','server']);
  api.use(['http', 'mongo'], ['client', 'server']);
  api.addFiles('csv-server.coffee', 'server');
  api.addFiles('csv-shared.coffee', ['client', 'server']);
  api.addFiles('csv-client.coffee', 'client');
});
