sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiorielementsapp/test/integration/FirstJourney',
		'fiorielementsapp/test/integration/pages/GenreList',
		'fiorielementsapp/test/integration/pages/GenreObjectPage'
    ],
    function(JourneyRunner, opaJourney, GenreList, GenreObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiorielementsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGenreList: GenreList,
					onTheGenreObjectPage: GenreObjectPage
                }
            },
            opaJourney.run
        );
    }
);