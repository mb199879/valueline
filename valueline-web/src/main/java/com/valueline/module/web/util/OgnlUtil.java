package com.valueline.module.web.util;

import ognl.Ognl;
import ognl.OgnlException;

public class OgnlUtil {

	public static Object getValue(Object root, String expression) {
		try {
			return Ognl.getValue(expression, root);
		} catch (OgnlException e) {
			throw new RuntimeException(e);
		}
	}

}
