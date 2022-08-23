package UserLogin;

public class WrongFormatInPasswordException extends InvalidPasswordException{

	
	private static final long serialVersionUID = 1L;
	public WrongFormatInPasswordException() {
		super(); }
	public  WrongFormatInPasswordException(String message) {
		super(message);

}
}
