package UserLogin;

public class UnmatchedUserNameException extends InvalidUserNameException{

	
	private static final long serialVersionUID = 1L;
	public  UnmatchedUserNameException() {
		super(); }
	public  UnmatchedUserNameException(String message) {
		super(message);

}
}
