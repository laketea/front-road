/**
 * 
 */
package com.bookstore.util;

import java.util.Random;

/**
 * @author Administrator
 *
 */
public class Generator {
	private static  Random random = null;
	static{
		random=new Random();	
	}
	
	public Generator(){		
	}
	
	public static String getEmailCode(){
		long rnd = random.nextLong();		
		return Long.toHexString(rnd);
	}
}
