package ba;

public class BankAccount {
    int accno;
    float balance;

    public BankAccount(int accno){
        this.accno = accno;
    }
    public void deposit (float x){
        balance +=x; 
    }
	public float withdraw (float x){
        balance -=x;
        return balance;
    }
	public int getaccountno (){
        return accno;
    }
	public float getbalance (){
        return balance;
    }
    public void taxdeduction (){
		balance=balance-(balance/10);
		System.out.println("Tax deducted : "+(balance/10));
    }
}



