package voter.age;

public class TooYoungAgeException extends AgeCeilingException {
	private static final long serialVersionUID = 1L;
	public TooYoungAgeException() {
		super();
	}
	public TooYoungAgeException(String message) {
		super(message);
	}
}
