package com.filipenevola.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class SchedulerJob extends QuartzJobBean {
	private SchedulerTask schedulerTask;

	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {

		schedulerTask.printSchedulerMessage();

	}

	public void setSchedulerTask(SchedulerTask schedulerTask) {
		this.schedulerTask = schedulerTask;
	}

}