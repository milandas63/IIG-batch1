package voter.age;

public class NegativeAgeException extends InvalidAgeException {
	private static final long serialVersionUID = 1L;
	public NegativeAgeException() {
		super();
	}
	public NegativeAgeException(String message) {
		super(message);
	}

}
