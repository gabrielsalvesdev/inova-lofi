using { myAppSrv } from '../srv/service.cds';

annotate myAppSrv.Genre with @UI.HeaderInfo: {
  TypeName: 'Genre',
  TypeNamePlural: 'Genres'
};
annotate myAppSrv.Genre with {
  image @Common.Label: 'Image';
  name @Common.Label: 'Name';
  stations @Common.Label: 'Stations'
};
annotate myAppSrv.Genre with @UI.LineItem #GenreList: [
    { $Type: 'UI.DataField', Value: image },
    { $Type: 'UI.DataField', Value: name }
];
annotate myAppSrv.Genre with @UI.SelectionPresentationVariant #GenreList: {
  Text : 'Genre',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#GenreList']
  }
};
annotate myAppSrv.Genre with @UI.LineItem #StationList: [
    { $Type: 'UI.DataField', Value: stations.image },
    { $Type: 'UI.DataField', Value: stations.audioStream }
];
annotate myAppSrv.Genre with @UI.SelectionPresentationVariant #StationList: {
  Text : 'Station',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#StationList']
  }
};
annotate myAppSrv.Genre with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: image },
    { $Type: 'UI.DataField', Value: name }
]};
annotate myAppSrv.Station with @UI.LineItem #Genre_stations: [
    { $Type: 'UI.DataField', Value: image },
    { $Type: 'UI.DataField', Value: audioStream }
];
annotate myAppSrv.Genre with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'stations', Label: 'Stations', Target: 'stations/@UI.LineItem#Genre_stations' }
];
annotate myAppSrv.Station with {
  genre @Common.ValueList: {
    CollectionPath: 'Genre',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: genre_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'image'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate myAppSrv.Station with @UI.HeaderInfo: {
  TypeName: 'Station',
  TypeNamePlural: 'Stations'
};
annotate myAppSrv.Station with {
  image @Common.Label: 'Image';
  audioStream @Common.Label: 'Audio Stream';
  genre @Common.Label: 'Genre'
};
annotate myAppSrv.Station with @UI.SelectionFields: [
  genre_ID
];
annotate myAppSrv.Station with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: image },
    { $Type: 'UI.DataField', Value: audioStream },
    { $Type: 'UI.DataField', Label: 'Genre', Value: genre_ID }
];
annotate myAppSrv.Station with @UI.FieldGroup #stationDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: image },
    { $Type: 'UI.DataField', Value: audioStream }

  ]
};


annotate myAppSrv.Station with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'stationDetails', Label: 'Station Details', Target: '@UI.FieldGroup#stationDetails' }
];