import tddmicroexercises.turnticketdispenser.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import static junit.framework.TestCase.*;

public class TickerDispenserTest {

    @Test
    public void a_new_ticket_must_have_the_turn_number_subsequent_to_the_previous_ticket() {
        // Arrange
        TicketDispenser ticketDispenser = new TicketDispenser();

        // Act
        TurnTicket previousTicket = ticketDispenser.getTurnTicket();
        TurnTicket newTicket = ticketDispenser.getTurnTicket();

        // Assert
        assertTrue(newTicket.getTurnNumber() > previousTicket.getTurnNumber());
    }

    // TODO: a new ticket must have the turn number subsequent to the previous ticket from another dispenser
    // TODO: after ticket 10 comes ticket 11

}
