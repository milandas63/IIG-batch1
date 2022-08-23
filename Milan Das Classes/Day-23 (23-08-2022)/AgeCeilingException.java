package voter.age;

public class AgeCeilingException extends AgeException {
	private static final long serialVersionUID = 1L;
	public AgeCeilingException() {
		super();
	}
	public AgeCeilingException(String message) {
		super(message);
	}
}
