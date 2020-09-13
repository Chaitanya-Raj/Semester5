import ba.BankAccount;
import java.util.*;

public class Bank {
	ArrayList<BankAccount> accounts = new ArrayList<>();
	int noacc = 0;

	void addaccount() {
		noacc++;
		accounts.add(new BankAccount(noacc));
	}

	void gettotalbal() {
		float tot = 0;
		for (int i = 0; i < noacc; i++) {
			tot += accounts.get(i).getbalance();
		}
		System.out.println("Total balance of the bank is:" + tot);
	}

	void getmaxmin() {
		int minacc = 1, maxacc = 1;
		float min = 0, max = 0;
		min = accounts.get(0).getbalance();
		max = accounts.get(0).getbalance();
		for (int i = 0; i < noacc; i++) {
			if (min > accounts.get(i).getbalance())
				minacc = accounts.get(i).getaccountno();
			if (max < accounts.get(i).getbalance())
				maxacc = accounts.get(i).getaccountno();
		}
		System.out.println("The minimum and maximum balance accounts out of all accounts respectively is:" + minacc
				+ " " + maxacc);
	}

	void findaccount() {
		System.out.println("Enter the account no you want to find:");
		Scanner sc = new Scanner(System.in);
		int ac = sc.nextInt();
		int flag = 0;
		for (int i = 0; i < noacc; i++) {
			if (ac == accounts.get(i).getaccountno()) {
				System.out.println("Account no:" + ac);
				System.out.println("Balance: " + accounts.get(i).getbalance());
				flag = 1;
			}
		}
		if (flag == 0) {
			System.out.println("Account not found: ");
		}
		sc.close();
	}

	public void atleastbal() {
		System.out.println("Enter the least amount of balance:");
		Scanner sc = new Scanner(System.in);
		int lbal = sc.nextInt();
		int count = 0;
		for (int i = 0; i < noacc; i++) {
			if (accounts.get(i).getbalance() >= lbal)
				count++;
		}
		System.out.println("No of accounts having atleast " + lbal + " balance is:" + count);
		sc.close();
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Bank b1 = new Bank();
		int ch;
		do {
			System.out.println("Press 1 to addaccount:");
			System.out.println("Press 2 to get totalbalance:");
			System.out.println("Press 3 to get account with maximum and minimum balance:");
			System.out.println("Press 4 to findaccount:");
			System.out.println("Press 5 to count no of account with atleast a specified amount:");
			System.out.println("Press 6 to change an account:");
			ch = sc.nextInt();
			switch (ch) {
				case 1: {
					b1.addaccount();
					break;
				}
				case 2: {
					b1.gettotalbal();
					break;
				}
				case 3: {
					b1.getmaxmin();
					break;
				}
				case 4: {
					b1.findaccount();
					break;
				}
				case 5: {
					b1.atleastbal();
					break;
				}
				case 6: {
					int no = 0;
					System.out.println("Enter account number:");
					no = sc.nextInt();
					if (no > b1.noacc || no < 0)
						System.out.println("Invalid account no:");
					else {
						System.out.println("Welcome account no:" + no);
						int ch1 = 0;
						do {
							System.out.println("Press 1 to add amount:");
							System.out.println("Press 2 to show balance:");
							System.out.println("Press 3 to withdraw:");
							ch1 = sc.nextInt();
							switch (ch1) {
								case 1: {
									float amou = 0;
									System.out.println("Enter the amount:");
									amou = sc.nextInt();
									b1.accounts.get(no - 1).deposit(amou);
									break;
								}
								case 2: {
									System.out.println("The amount is:" + b1.accounts.get(no - 1).getbalance());
									break;
								}
								case 3: {
									float amou = 0;
									System.out.println("Enter the amount you want to withdraw:");
									amou = sc.nextInt();
									if (amou <= b1.accounts.get(no - 1).getbalance())
										b1.accounts.get(no - 1).withdraw(amou);
									else
										System.out.println("Can't take out more money than you actually have:");
									break;
								}
							}
							System.out.println("Do you wish to continue?(y=1)");
							ch1 = sc.nextInt();
						} while (ch1 == 1);
					}
				}
				default:
					System.out.println("Wrong choice:");
			}
			System.out.println("Do you want to continue(y=1)");
			ch = sc.nextInt();
		} while (ch == 1);
		sc.close();
	}
}
