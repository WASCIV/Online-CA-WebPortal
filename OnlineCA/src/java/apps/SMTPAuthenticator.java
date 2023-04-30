/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apps;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author chandan
 */
public class SMTPAuthenticator extends Authenticator {

    private PasswordAuthentication authentication;

    public SMTPAuthenticator(String login, String password) {
        authentication = new PasswordAuthentication(login, password);
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return authentication;
    }
}
