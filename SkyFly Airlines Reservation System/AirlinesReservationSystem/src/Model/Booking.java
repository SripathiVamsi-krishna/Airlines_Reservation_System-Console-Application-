package Model;

public class Booking {
    public double getBasePrice() {
        return basePrice;
    }

    private final double basePrice;
    private String bookingId;
    private String passengerName;

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }



    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    private double ticketPrice;

    private double totalPrice;

    public Booking(String bookingId, String passengerName,double basePrice, double ticketPrice, double totalPrice) {
        this.bookingId = bookingId;
        this.passengerName = passengerName;
        this.ticketPrice = ticketPrice;
        this.basePrice = basePrice;

        this.totalPrice = totalPrice;
    }


// Getters and setters (if required)
}
