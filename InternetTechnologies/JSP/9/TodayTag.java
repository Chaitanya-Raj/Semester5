package jspq9;
import java.io.*;
import java.util.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import javax.servlet.jsp.JspWriter;

public class TodayTag extends SimpleTagSupport{
	public void doTag() throws IOException,JspException{
		Date mydate=new Date();
		JspWriter out=getJspContext().getOut();
		out.println(mydate.toString());		
	}
}
