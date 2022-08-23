package voter.age;

public class TooOldAgeException extends AgeCeilingException {
	private static final long serialVersionUID = 1L;
	public TooOldAgeException() {
		super();
	}
	public TooOldAgeException(String message) {
		super(message);
	}
}
