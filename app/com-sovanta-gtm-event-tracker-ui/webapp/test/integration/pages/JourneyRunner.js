sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"comsovantagtmeventtrackerui/test/integration/pages/EventsList",
	"comsovantagtmeventtrackerui/test/integration/pages/EventsObjectPage"
], function (JourneyRunner, EventsList, EventsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('comsovantagtmeventtrackerui') + '/test/flp.html#app-preview',
        pages: {
			onTheEventsList: EventsList,
			onTheEventsObjectPage: EventsObjectPage
        },
        async: true
    });

    return runner;
});

