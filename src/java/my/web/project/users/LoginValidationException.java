
package my.web.project.users;

public class LoginValidationException extends Exception
{

    public LoginValidationException() {
        super ("Exceptie de validare la logare");
    }

    public LoginValidationException(String message) {
        super(message);
    }
    
    
    
}
