import tddmicroexercises.turnticketdispenser.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import static junit.framework.TestCase.*;

class MockTurnNumberSequence extends TurnNumberSequence {
	private int currentSeq;
	
	public MockTurnNumberSequence(int currentSeq) {
		this.currentSeq = currentSeq;
	}
	public int getNextTurnNumber() {
		return this.currentSeq;
	}
}

public class TickerDispenserTest {

	@Test
	public void getTurnTicket() {
		TicketDispenser ticketDispenser = new TicketDispenser();
		TurnNumberSequence tns = new MockTurnNumberSequence(2);
		
		TurnTicket ticket = ticketDispenser.getTurnTicket(tns);
				
		assertEquals(2, ticket.getTurnNumber());
	}

    // TODO-working-on: a new ticket must have the turn number subsequent to the previous ticket
    @Test
    public void a_new_ticket_must_have_the_turn_number_subsequent_to_the_previous_ticket() {
        // Arrange

        // Act

        // Assert
        assertTrue(newTicket.getTurnNumber() > previousTicket.getTurnNumber());
    }

    // TODO: a new ticket must have the turn number subsequent to the previous ticket from another dispenser
    // TODO: after ticket 10 comes ticket 11

}
