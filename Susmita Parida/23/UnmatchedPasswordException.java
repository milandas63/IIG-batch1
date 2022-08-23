package UserLogin;

public class UnmatchedPasswordException extends InvalidPasswordException{

	
	private static final long serialVersionUID = 1L;
	public UnmatchedPasswordException() {
		super(); }
	public   UnmatchedPasswordException(String message) {
		super(message);

}
}
