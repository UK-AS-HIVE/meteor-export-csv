Package.describe({
  name: 'hive:export-csv',
  summary: 'Export CSV of a given collection.',
  version: '1.0.1',
  git: ''
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.1');
  api.use(['coffeescript', 'meteor'], ['client','server']);
  api.use(['iron:router@1.0.6', 'http', 'mongo', 'meteorhacks:fast-render'], ['client', 'server']);
  api.addFiles('csv-server.coffee', 'server');
  api.addFiles('csv-shared.coffee', ['client', 'server']);
  api.addFiles('csv-client.coffee', 'client');
});
