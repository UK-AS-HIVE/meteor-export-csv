Package.describe({
  name: 'hive:export-csv',
  summary: 'Export CSV of a given collection.',
  version: '1.1.1',
  git: ''
});

Package.onUse(function(api) {
  api.versionsFrom('1.3');
  api.use(['coffeescript', 'meteor'], ['client','server']);
  api.use(['tracker', 'accounts-base', 'http', 'mongo'], ['client', 'server']);
  api.use(['chuangbo:cookie']);
  api.addFiles('csv-server.coffee', 'server');
  api.addFiles('csv-shared.coffee', ['client', 'server']);
  api.addFiles('csv-client.coffee', 'client');
  api.export(['exportCSV', 'downloadCSV', 'writeCSV']);
});
