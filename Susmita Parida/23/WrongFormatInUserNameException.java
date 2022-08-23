package UserLogin;

public class WrongFormatInUserNameException extends InvalidUserNameException {

	
	private static final long serialVersionUID = 1L;
	public WrongFormatInUserNameException() {
		super(); }
	public  WrongFormatInUserNameException(String message) {
		super(message);

}
}
