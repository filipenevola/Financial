package com.filipenevola.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Move;
import com.filipenevola.util.EnviaEmail;

@Service
public class EmailService {
	private static Logger LOG = Logger.getLogger(EmailService.class);

	public void sendMove(boolean newMove, Move move, boolean add) {
		LOG.info("Vai enviar email para: "
				+ move.getCategory().getNotificationList().split(";"));
		StringBuilder assunto = new StringBuilder("[Financeiro] - ");
		assunto.append(move.getName());
		assunto.append(" (R$ ");
		assunto.append(move.getValue());
		assunto.append(")");
		StringBuilder corpo = new StringBuilder("O sistema financeiro ");
		corpo.append(add ? (newMove ? "ADICIONOU" : "ALTEROU") : "REMOVEU");
		corpo.append(" um gasto e está lhe notificando através deste email.<br/><br/>");
		corpo.append("<b>Gasto:</b> ");
		corpo.append(move.getName());
		corpo.append("<br/><b>Valor:</b> R$ ");
		corpo.append(move.getValue());
		corpo.append("<br/><b>Local:</b> ");
		corpo.append(move.getPlace());
		corpo.append("<br/><b>Data:</b> ");
		corpo.append(move.getDateOfMove());
		enviarEmail(move.getCategory().getNotificationList(),
				assunto.toString(), corpo.toString());

	}

	public void sendCollectiveBuy(CollectiveBuy cb) {
		LOG.info("Vai enviar email para: " + cb.getUsers().getEmail());
		StringBuilder assunto = new StringBuilder(
				"[Financeiro][CC/Fim:");
		assunto.append(cb.getEndDate());
		assunto.append("] - ");
		assunto.append(cb.getName());
		assunto.append(" (R$ ");
		assunto.append(cb.getValue());
		assunto.append(")");
		StringBuilder corpo = new StringBuilder(
				"O sistema financeiro identificou que está compra coletiva está próxima de expirar<br/><br/>");
		corpo.append("<b>Oferta:</b> ");
		corpo.append(cb.getName());
		corpo.append("<br/><b>Valor Pago:</b> R$ ");
		corpo.append(cb.getValue());
		corpo.append("<br/><b>Valor Original:</b> R$ ");
		corpo.append(cb.getValue());
		corpo.append("<br/><b>Local:</b> ");
		corpo.append(cb.getPlace());
		corpo.append("<br/><b>Data da Compra:</b> ");
		corpo.append(cb.getDateOfBuy());
		corpo.append("<br/><b>Data de início:</b> ");
		corpo.append(cb.getStartDate());
		corpo.append("<br/><b>Data da fim:</b> ");
		corpo.append(cb.getEndDate());
		corpo.append("<br/><b>Pode ser usado:</b> ");
		corpo.append(cb.getCanUseDays());
		corpo.append("<br/><b>Já foi impresso?:</b> ");
		corpo.append(cb.getPrinted() ? "sim" : "não");
		enviarEmail(cb.getUsers().getEmail(), assunto.toString(),
				corpo.toString());

	}

	private void enviarEmail(final String para, final String assunto,
			final String mensagem) {
		final EnviaEmail ee = new EnviaEmail();
		new Thread() {
			public void run() {
				if (!ee.enviar(para, assunto, mensagem)) {
					// Sempre que um e-mail falha o enviador em Lotes é ativado
					// depois
					// de 5minutos
					// HelperFactory.getComunicadoHelper().enviaComunicadosPendentes();

				}
			}
		}.start();

	}
}
