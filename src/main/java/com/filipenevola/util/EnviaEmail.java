
package com.filipenevola.util;


import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class EnviaEmail {
	private static Logger LOG = Logger.getLogger(EnviaEmail.class);

	private String mailSMTPServer;
	private String mailSMTPServerPort;

	/*
	 * quando instanciar um Objeto ja sera atribuido o servidor SMTP do GMAIL e
	 * a porta usada por ele
	 */
	public EnviaEmail() { // Para o GMAIL
		mailSMTPServer = "smtp.gmail.com";
		mailSMTPServerPort = "465";
	}

	/*
	 * caso queira mudar o servidor e a porta, so enviar para o contrutor os
	 * valor como string
	 */

	public EnviaEmail(String mailSMTPServer, String mailSMTPServerPort) { // Para
																			// outro
																			// Servidor
		this.mailSMTPServer = mailSMTPServer;
		this.mailSMTPServerPort = mailSMTPServerPort;
	}

	public Boolean enviar(String to, String subject, String message) {
		String from = "filipenevola@gmail.com";
		String pass = "zxcpoi00";
		Properties props = new Properties();

		// quem estiver utilizando um SERVIDOR PROXY descomente essa parte e
		// atribua as propriedades do SERVIDOR PROXY utilizado
		/*
		 * props.setProperty("proxySet","true");
		 * props.setProperty("socksProxyHost","192.168.155.1"); // IP do
		 * Servidor Proxy props.setProperty("socksProxyPort","1080"); // Porta
		 * do servidor Proxy
		 */

		props.put("mail.transport.protocol", "smtp"); // define protocolo de
														// envio como SMTP
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", mailSMTPServer); // server SMTP do GMAIL
		props.put("mail.smtp.auth", "true"); // ativa autenticacao
		props.put("mail.smtp.user", from); // usuario ou seja, a conta que esta
											// enviando o email (tem que ser do
											// GMAIL)
		props.put("mail.debug", "true");
		props.put("mail.smtp.port", mailSMTPServerPort); // porta
		props.put("mail.smtp.socketFactory.port", mailSMTPServerPort); // mesma
																		// porta
																		// para
																		// o
																		// socket
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");

		// Cria um autenticador que sera usado a seguir
		SimpleAuth auth = null;
		auth = new SimpleAuth(from, pass);

		// Session - objeto que ira realizar a conexÃ£o com o servidor
		/*
		 * Como hÃ¡ necessidade de autenticaÃ§Ã£o Ã© criada uma
		 * autenticacao que Ã© responsavel por solicitar e retornar o
		 * usuÃ¡rio e senha para autenticaÃ§Ã£o
		 */
		Session session = Session.getDefaultInstance(props, auth);
		session.setDebug(false);

		// Objeto que contÃ©m a mensagem
		Message msg = new MimeMessage(session);

		try {
			// Setando o destinatÃ¡rio
			// msg.setRecipient(Message.RecipientType.TO, new
			// InternetAddress(to));
			msg.setRecipients(Message.RecipientType.TO,
					createInternetAddressList(to));
			// Setando a origem do email
			msg.setFrom(new InternetAddress(from));
			// Setando o assunto
			msg.setSubject(subject);
			// Setando o conteÃºdo/corpo do email
			msg.setContent(message, "text/html");

		} catch (Exception e) {

			LOG.error("Erro Mensagem Incompleta.", e);
			e.printStackTrace();
			return false;
		}

		// Objeto encarregado de enviar os dados para o email
		Transport tr;
		try {
			tr = session.getTransport("smtp"); // define smtp para transporte
			/*
			 * 1 - define o servidor smtp 2 - seu nome de usuario do gmail 3 -
			 * sua senha do gmail
			 */
			tr.connect(mailSMTPServer, from, pass);
			msg.saveChanges(); // don't forget this
			// envio da mensagem
			tr.sendMessage(msg, msg.getAllRecipients());
			tr.close();
		} catch (Exception e) {
			LOG.error("Erro no Envio do Email.", e);
			e.printStackTrace();
			return false;
		}
		return true;

	}

	private InternetAddress[] createInternetAddressList(String to) {
		List<String> emails = Arrays.asList(to.split(";"));
		InternetAddress[] addresses = new InternetAddress[emails.size()];
		int i = 0;
		for (String email : emails) {
			try {
				addresses[i++] = new InternetAddress(email);
			} catch (AddressException e) {
				LOG.error("Invalid address", e);
				e.printStackTrace();
			}
		}

		return addresses;
	}
}

// clase que retorna uma autenticacao para ser enviada e verificada pelo
// servidor smtp
class SimpleAuth extends Authenticator {

	public String username = null;
	public String password = null;

	public SimpleAuth(String user, String pwd) {
		username = user;
		password = pwd;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);
	}
}
