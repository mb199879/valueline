package com.valueline.module.web.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

import com.valueline.module.web.util.ActionSupport;

public class Upload extends ActionSupport {
	
	private File attachment;
	
	private String attachmentFileName;
	
	private String attachmentUrl;
	
	public String execute() {
		try {
			Date currentDate = new Date();
			File base = new File("C:/valueline_files");
			File dir = new File(base, "asset/" + DateFormatUtils.format(currentDate, "yyyyMM"));
			if (!dir.exists())
				dir.mkdir();
			File file = new File(dir, DateFormatUtils.format(currentDate, "yyyyMMddHHmmss") + RandomStringUtils.randomNumeric(6) + "." + FilenameUtils.getExtension(attachmentFileName));
			FileUtils.copyFile(attachment, file);
			attachmentUrl = "/" + base.toURI().relativize(file.toURI());
			return SUCCESS;
		} catch (IOException e) {
			throw new RuntimeException();
		}
	}

	public File getAttachment() {
		return attachment;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}

	public String getAttachmentFileName() {
		return attachmentFileName;
	}

	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

}
