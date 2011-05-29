package com.filipenevola.schedule;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class ScheduledProcessor {
	private static Logger LOG = Logger.getLogger(ScheduledProcessor.class);

	@Autowired
	private CollectiveBuyAsync collectiveBuyAsync;

	@Scheduled(cron = "0 0 5 * * ?")
	public void checkCollectiveBuys() {
		LOG.info("ScheduledProcessor - Starting quartz task");

		LOG.info("ScheduledProcessor - Starting checking collective buys near the end");

		collectiveBuyAsync.checkNearTheEnd();

		LOG.info("ScheduledProcessor - Checked collective buys near the end");

		LOG.info("ScheduledProcessor - Finishing quartz task");
	}
}
