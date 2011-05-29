package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.chart.DataItem;
import com.filipenevola.chart.RadarItem;
import com.filipenevola.dao.MoveDAO;
import com.filipenevola.model.Category;
import com.filipenevola.model.Move;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/** 
 * @author Filipe Névola
 */
@Service
public class MoveService {
	private static Logger LOG = Logger.getLogger(MoveService.class);

	private static final boolean NEW_MOVE = true;
	private static final boolean UPDATED_MOVE = false;
	@Autowired
	private MoveDAO moveDAO;
	@Autowired
	private EmailService emailService;
	@Autowired
	private Util util;

	public List<RadarItem> sumByMonthByCategory(Users user,
			Integer[] categories, Boolean pay) {

		return moveDAO.sumByMonthByCategory(user, Arrays.asList(categories),
				pay);
	}

	public List<Category> getCategories(Users user) {
		return moveDAO.getCategories(user);
	}
	public List<Move> getMoveList(Users user, Integer start, Integer pageSize,
			String field, String value) {
		LOG.info("getMoveList - field: " + field + ", value: " + value);
		return moveDAO.getMoves(user, start, pageSize, field, value);
	}

	public Integer getTotalMove(Users user, String field, String value) {
		return moveDAO.getTotalMove(user, field, value);
	}

	public List<Move> create(Object data) throws ParseException {

		List<Move> newMoves = new ArrayList<Move>();

		List<Move> list = util.getMovesFromRequest(data);

		for (Move move : list) {
			newMoves.add(moveDAO.addMove(move));
			sendMoveToNotificationList(NEW_MOVE, move, true);
		}

		return newMoves;
	}

	public void createFromForm(Move move) throws ParseException {
		moveDAO.addMove(move);
	}

	public List<Move> update(Object data) throws ParseException {

		List<Move> returnMoves = new ArrayList<Move>();

		List<Move> updatedMoves = util.getMovesFromRequest(data);

		for (Move move : updatedMoves) {
			returnMoves.add(moveDAO.updateMove(move));
			sendMoveToNotificationList(UPDATED_MOVE, move, true);
		}

		return returnMoves;
	}

	private void sendMoveToNotificationList(final boolean newMove, Move move,
			final boolean add) {
		final Move moveThread = moveDAO.getMove(move);
		if (moveThread.getSendNotification() != null
				&& moveThread.getSendNotification()
				&& moveThread.getCategory().getNotificationList() != null
				&& moveThread.getCategory().getNotificationList().length() > 0) {
			emailService.sendMove(newMove, moveThread, add);
		}
	}

	public void delete(Object data) {

		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {

			List<Integer> deleteMoves = util.getListIdFromJSON(data);

			for (Integer id : deleteMoves) {
				Move move = new Move();
				move.setId(id);
				sendMoveToNotificationList(UPDATED_MOVE, move, false);
				moveDAO.deleteMove(id);
			}

		} else { // it is only one object - cast to object/bean

			Integer id = Integer.parseInt(data.toString());

			Move move = new Move();
			move.setId(id);
			sendMoveToNotificationList(UPDATED_MOVE, move, false);
			moveDAO.deleteMove(id);
		}
	}

	public List<DataItem> movesDataByCategoryAndMonth(Users user,
			String monthYear, Integer categoryId) {
		return moveDAO.movesDataByCategoryAndMonth(user, monthYear, categoryId);
	}

	public List<Move> movesByMonth(Users user, String month, Integer dateType) {
		return moveDAO.movesOfMonth(user, month, dateType);
	}

}
