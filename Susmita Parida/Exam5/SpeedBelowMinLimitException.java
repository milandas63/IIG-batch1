package test5;

public class SpeedBelowMinLimitException extends RailwayTrackException {
	private static final long serialVersionUID = 1L;
	public SpeedBelowMinLimitException() {
		super();
	}
	public SpeedBelowMinLimitException(String message) {
		super(message);
	}

}
