package tddmicroexercises.turnticketdispenser;

public class TicketDispenser
{
    public TurnTicket getTurnTicket(TurnNumberSequence tns)
    {
        int newTurnNumber = tns.getNextTurnNumber();
        TurnTicket newTurnTicket = new TurnTicket(newTurnNumber);

        return newTurnTicket;
    }
}
