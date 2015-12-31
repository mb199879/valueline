package com.valueline.module.web.util;

import com.octo.captcha.engine.image.gimpy.HotmailEngine;
import com.octo.captcha.module.servlet.image.SimpleImageCaptchaServlet;
import com.octo.captcha.service.captchastore.FastHashMapCaptchaStore;
import com.octo.captcha.service.image.DefaultManageableImageCaptchaService;

public class MyImageCaptchaServlet extends SimpleImageCaptchaServlet {

	static {
		service = new DefaultManageableImageCaptchaService(new FastHashMapCaptchaStore(), new HotmailEngine(), 180, 100000, 75000);
	}

}
