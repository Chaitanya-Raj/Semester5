import java.util.*;
abstract class stack1
{
	abstract void push(int ele);
	abstract int pop();
	abstract void display();
}
class staticStack extends stack1
{
	int arr[]=new int[20];
	int size;
	int top=-1;
	public staticStack(int size)
	{
		this.size=size;
	}
	public void push(int ele)
	{
		if(top==size)
			System.out.println("Overflow");
		else
		{
			top++;
			arr[top]=ele;
		}
	}
	public int pop()
	{
		if(top==-1)
			System.out.println("Underflow");
		else
			return arr[top--];
		return -1;
	}
	public void display()
	{
		if(top==-1)
			System.out.println("Stack is empty");
		else
		{
			for(int i=top;i>=0;i--)
				System.out.println(arr[i]+"->");
		}
	}
}
class dynamicStack extends stack1
{
	ArrayList<Integer> arr= new ArrayList<>(); 	
	int top=-1;
	public void push(int ele)
	{
			top++;
			arr.add(ele);
	}
	public int pop()
	{
		if(top==-1)
			System.out.println("Underflow");
		else
			return arr.remove(top--);
		return -1;
	}
	public void display()
	{
		if(top==-1)
			System.out.println("Stack is empty");
		else
		{
			for(int i=top;i>=0;i--)
				System.out.print(arr.get(i)+"->");
		}
	}
}
public class Stack
{
	public static void main(String[] args)
	{
		int ch;
		Scanner sc= new Scanner(System.in);
		do
		{
			System.out.print("Enter 1 for static stack or 2 for dynamic stack : ");
			ch=sc.nextInt();
			switch(ch)
			{
				case 1: {
					System.out.print("Enter the size of the stack : ");
					ch=sc.nextInt();
					staticStack s1= new staticStack(ch);
					do
					{
						int element=0;
						System.out.println("1: push");
						System.out.println("2: pop");
						System.out.println("3: display");
						ch=sc.nextInt();
						switch(ch)
						{
							case 1: {
								System.out.print("Enter the element you want to enter : ");
								element=sc.nextInt();
								s1.push(element);
								break;
							}
							case 2: {
								element=s1.pop();
								if(element!=-1)
								System.out.println("Element popped is "+ element);
								break;
							}
							case 3: {
								s1.display();
								break;
							}
							default: {
								System.out.println("Wrong choice");
							}
						}
						System.out.println("Do you wish to continue?(1=yes):");
						ch=sc.nextInt();
					}while(ch==1);
					break;
				}
				case 2: {
					dynamicStack s2= new dynamicStack();
					do
					{
						int element=0;
						System.out.println("1: push");
						System.out.println("2: pop");
						System.out.println("3: display");
						ch=sc.nextInt();
						switch(ch)
						{
							case 1: {
								System.out.print("Enter the element you want to enter : ");
								element=sc.nextInt();
								s2.push(element);
								break;
							}
							case 2: {
								element=s2.pop();
								if(element!=-1)
								System.out.println("Element popped is " + element);
								break;
							}
							case 3: {
								s2.display();
								break;
							}
							default: {
								System.out.println("Wrong choice");
							}
						}
						System.out.println("Do you wish to continue?(1=yes):");
						ch=sc.nextInt();
					}while(ch==1);
					break;
				}
				default: {
					System.out.println("Wrong choice");
				}
			}
			System.out.println("Do you wish to make stacks again?(y=1):");
			ch=sc.nextInt();
		}while(ch==1);
	}
}