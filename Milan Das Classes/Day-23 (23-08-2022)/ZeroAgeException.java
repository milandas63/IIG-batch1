package voter.age;

public class ZeroAgeException extends InvalidAgeException {
	private static final long serialVersionUID = 1L;
	public ZeroAgeException() {
		super();
	}
	public ZeroAgeException(String message) {
		super(message);
	}
}
