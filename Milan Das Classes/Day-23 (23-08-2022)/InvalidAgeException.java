package voter.age;

public class InvalidAgeException extends AgeException {
	private static final long serialVersionUID = 1L;
	public InvalidAgeException() {
		super();
	}
	public InvalidAgeException(String message) {
		super(message);
	}

}
