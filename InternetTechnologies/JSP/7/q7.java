import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;

public class Q7 extends SimpleTagSupport
{
    String input;
    public void setInput(String input)
    {
        this.input=input;
    }
    public void doTag() throws IOException
    {
        JspWriter out = getJspContext().getOut();
        for(int i=input.length()-1;i>=0;i--)
        {
            out.print(input.charAt(i));
        }
    }
}