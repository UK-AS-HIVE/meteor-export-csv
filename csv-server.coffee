Meteor.startup ->
  if !Meteor.settings.public.csv
    throw new Error "CSV Export Settings Missing. Please add a settings file and load meteor with --settings mysettings.json"