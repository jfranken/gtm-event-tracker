const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
  const { Events } = this.entities;

  // Validation before CREATE and UPDATE
  this.before(['CREATE', 'UPDATE'], Events, async (req) => {
    const { eventName, eventDate, expectedGuests, status } = req.data;

    // Validate eventName is not empty or whitespace
    if (eventName !== undefined && (!eventName || eventName.trim() === '')) {
      req.error(400, 'Event name cannot be empty', 'eventName');
    }

    // Validate eventDate is not in the past for Planning status
    if (eventDate && status === 'Planning') {
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const inputDate = new Date(eventDate);
      
      if (inputDate < today) {
        req.error(400, 'Event date cannot be in the past for events with Planning status', 'eventDate');
      }
    }

    // Validate expectedGuests is >= 0
    if (expectedGuests !== undefined && expectedGuests < 0) {
      req.error(400, 'Expected guests must be greater than or equal to zero', 'expectedGuests');
    }
  });

  // Handler for StatusValues value help
  this.on('READ', 'StatusValues', async () => {
    return [
      { code: 'Planning', name: 'Planning' },
      { code: 'Confirmed', name: 'Confirmed' },
      { code: 'Completed', name: 'Completed' },
      { code: 'Cancelled', name: 'Cancelled' }
    ];
  });
});
