package RailwayExp;

public class SpeedAboveMaxLimitException extends RailwayTrackException {
	private static final long serialVersionUID = 1L;
	public SpeedAboveMaxLimitException() {
		super();
	}
	public SpeedAboveMaxLimitException(String message) {
		super(message);
	}

}

