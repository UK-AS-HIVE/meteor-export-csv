Meteor.startup ->
  if not Meteor.settings?.public?.csv?.exportUrl?
    Meteor.settings = _.extend
      public:
        csv:
          exportUrl: '/export'
      , Meteor.settings
