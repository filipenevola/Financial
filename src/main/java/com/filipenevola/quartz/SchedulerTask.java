package com.filipenevola.quartz;

import org.apache.log4j.Logger;

import com.filipenevola.service.CollectiveBuyService;

public class SchedulerTask {
	private static Logger LOG = Logger.getLogger(SchedulerTask.class);

	private CollectiveBuyService collectiveBuyService;

	public void printSchedulerMessage() {
		if (collectiveBuyService != null) {
			LOG.info("collectiveBuyService initialized with sucessful");
		} else {
			LOG.error("collectiveBuyService not initialized with sucessful");
		}
		LOG.info("QUARTZ - Starting quartz task");

		LOG.info("QUARTZ - Starting checking collective buys near the end");

		collectiveBuyService.checkNearTheEnd();

		LOG.info("QUARTZ - Checked collective buys near the end");

		LOG.info("QUARTZ - Finishing quartz task");

	}

	public void setCollectiveBuyService(
			CollectiveBuyService collectiveBuyService) {
		this.collectiveBuyService = collectiveBuyService;
	}

}
