#include <iostream>
#include <string>
#include <fstream>
#include <cstdlib>
using namespace std;
struct sybmtab
{
	char name[40];
	int size;
	string type;
	int location;
	int sectionid;
	string isglobal;
} symbol[10];
struct sectab
{
	char name[40];
	int size;
} section[10];
struct POT
{
	char pname[10];
	int size;
};
struct POT p[5] =
	{
		{"dd", 8},
		{"dw", 16}};
struct MOT
{
	char mname[10];
	int nmopc, nmsize;
};
struct MOT m[5] =
	{
		{"mov", 41, 2},
		{"add", 42, 1},
		{"sub", 43, 1},
		{"div", 44, 1}};
int no_of_symbols = 0;
int no_of_section = 0;
int size = 0;
//REgisters with their predefined values
int EAX = 40;
int DX = 50;
int ECX = 60;
int AC = 70;
string cod;
void pass1();
void pass2();
void printhexa(int);
int main()
{
	cout << "\nPerforming pass 1:";
	pass1();
	cout << "\nSymbol table:";
	cout << "\n";
	cout << "    name  |  location  |   type   |   size   |   isglobal   |   sectionid   |";
	cout << "\n";
	cout << "   ";
	for (int m = 0; m < no_of_symbols; m++)
	{
		for (int i = 0; symbol[m].name[i] != '\0'; i++)
			cout << symbol[m].name[i];
		cout << "     ";
		cout << symbol[m].location;
		cout << "        ";
		cout << symbol[m].type;
		cout << "       ";
		cout << symbol[m].size;
		cout << "           ";
		cout << symbol[m].isglobal;
		cout << "             ";
		cout << symbol[m].sectionid;
		cout << "\n";
		cout << "   ";
	}
	cout << "\n";
	cout << "Section table:\n";
	cout << "   name  |   size   ";
	cout << "\n   ";
	for (int m = 0; m < no_of_section; m++)
	{
		for (int i = 0; section[m].name[i] != '\0'; i++)
			cout << section[m].name[i];
		cout << "    ";
		cout << section[m].size;
		cout << "\n   ";
	}
	cout << "\nPerforming pass 2:";
	cout << "\nCode in hexadecimal:\n";
	pass2();
}
void printhexa(int n)
{
	// char array to store hexadecimal number
	char hexaDeciNum[100];

	// counter for hexadecimal number array
	int i = 0;
	if (n != 0)
	{
		while (n != 0)
		{
			// temporary variable to store remainder
			int temp = 0;

			// 	storing remainder in temp variable.
			temp = n % 16;

			// check if temp < 10
			if (temp < 10)
			{
				hexaDeciNum[i] = temp + 48;
				i++;
			}
			else
			{
				hexaDeciNum[i] = temp + 55;
				i++;
			}

			n = n / 16;
		}

		// printing hexadecimal number array in reverse order
		for (int j = i - 1; j >= 0; j--)
			cout << hexaDeciNum[j];
	}
	else
		cout << 0;
}
void pass1()
{
	fstream code;
	//char symbols[100][6][100];

	int lc = 0;
	code.open("code.txt", ios::in);
	if (!code)
		cout << "No such file";
	else
	{
		while (!code.eof())
		{
			char ch;
			code >> std::noskipws >> ch;
			cod[size] = ch;
			size++;
		}
		for (int i = 0; i < size; i++)
		{

			if (cod[i] == 'e' && cod[i + 1] == 'x' && cod[i + 2] == 't' && cod[i + 3] == 'e' && cod[i + 4] == 'r' && cod[i + 5] == 'n')
			{
				int j = i + 7;
				int k = 0;
				while (cod[j] != ' ' && cod[j] != '\n')
				{
					symbol[no_of_symbols].name[k] = cod[j];
					j++;
					k++;
				}
				symbol[no_of_symbols].type = "external";
				symbol[no_of_symbols].isglobal = "FALSE";
				no_of_symbols++;
			}
			if (cod[i] == 's' && cod[i + 1] == 'e' && cod[i + 2] == 'c' && cod[i + 3] == 't' && cod[i + 4] == 'i' && cod[i + 5] == 'o' && cod[i + 6] == 'n')
			{
				int j = i + 9;
				int k = 0;

				while (cod[j] != ' ' && cod[j] != '\n')
				{
					section[no_of_section].name[k] = cod[j];
					j++;
					k++;
				}
				if (no_of_section != 0)
					section[no_of_section - 1].size = lc;
				lc = 0;
				no_of_section++;
			}
			if (cod[i] == ':')
			{
				int j = i - 1;
				int k = 0;
				while (1)
				{
					if (cod[j] == ' ' || cod[j] == '\n')
						break;
					else
						j--;
				}
				for (j = j + 1; j < i; j++, k++)
				{
					symbol[no_of_symbols].name[k] = cod[j];
				}
				symbol[no_of_symbols].location = lc;
				if (cod[i + 2] = 'd' && (cod[i + 3] == 'b' || cod[i + 3] == 'w'))
				{
					int fw;
					symbol[no_of_symbols].type = "variable";
					if (cod[i + 2] = 'd' && cod[i + 3] == 'b')
					{
						fw = 1;
					}
					else
					{
						fw = 2;
					}
					for (j = i + 5; 1; j++)
					{
						if (cod[j] == ',')
						{
							lc = lc + fw;
							symbol[no_of_symbols].size += fw;
						}
						if (cod[j] == ' ' || cod[j] == '\n')
						{
							lc = lc + fw;
							symbol[no_of_symbols].size += fw;
							break;
						}
					}
				}
				else
					symbol[no_of_symbols].type = "label";
				symbol[no_of_symbols].isglobal = "FALSE";
				symbol[no_of_symbols].sectionid = no_of_section;
				no_of_symbols++;
			}
			if (cod[i] == 'm' && cod[i + 1] == 'o' && cod[i + 2] == 'v')
			{
				if (cod[i + 8] >= '0' && cod[i + 8] <= '9')
					lc = lc + 6;
				else
					lc = lc + 3;
			}
			if (cod[i] == 'a' && cod[i + 1] == 'd' && cod[i + 2] == 'd')
			{
				if (cod[i + 8] >= '0' && cod[i + 8] <= '9')
					lc = lc + 5;
				else
					lc = lc + 3;
			}
			if (cod[i] == 's' && cod[i + 1] == 'u' && cod[i + 2] == 'b')
			{
				if (cod[i + 8] >= '0' && cod[i + 8] <= '9')
					lc = lc + 5;
				else
					lc = lc + 3;
			}
			if (cod[i] == 'd' && cod[i + 1] == 'i' && cod[i + 2] == 'v')
			{
				if (cod[i + 8] >= '0' && cod[i + 8] <= '9')
					lc = lc + 5;
				else
					lc = lc + 3;
			}
		}
		section[no_of_section - 1].size = lc;
	}
}
void pass2()
{
	int lc = 0;
	int currsec = 0;
	fstream code;
	size = 0;
	//char symbols[100][6][100];
	code.open("code.txt", ios::in);
	if (!code)
		cout << "No such file";
	else
	{
		while (!code.eof())
		{
			char ch;
			code >> std::noskipws >> ch;
			cod[size] = ch;
			size++;
		}
		for (int i = 0; i < size; i++)
		{
			if (cod[i] == 'd' && cod[i + 1] == 'b')
			{
				printhexa(lc);
				cout << " ";
				int num = 0;
				int j = i + 3;
				while (1)
				{
					if (cod[j] == ',')
					{
						if (num < 16)
						{
							cout << 0;
						}
						//cout<<num<<"yo:";
						printhexa(num);
						num = 0;
						j++;
					}
					if (cod[j] == ' ' || cod[j] == '\n')
					{
						if (num < 16)
						{
							cout << 0;
						}
						printhexa(num);
						break;
					}
					else
					{
						int conv = cod[j];
						//cout<<conv<<"yolo";
						conv -= 48;
						num = num * 10 + conv;
						j++;
					}
				}
				lc += 4;
			}
			if (cod[i] == 'd' && cod[i + 1] == 'w')
			{
				printhexa(lc);
				cout << " ";
				int num = 0;
				int j = i + 3;
				while (1)
				{
					if (cod[j] == ',')
					{
						if (num < 16)
						{
							cout << "000";
						}
						else
						{
							cout << "00";
						}
						//cout<<num<<"yo:";
						printhexa(num);
						num = 0;
						j++;
					}
					if (cod[j] == ' ' || cod[j] == '\n')
					{
						if (num < 16)
						{
							cout << "000";
						}
						else
						{
							cout << "00";
						}
						printhexa(num);
						break;
					}
					else
					{
						int conv = cod[j];
						//cout<<conv<<"yolo";
						conv -= 48;
						num = num * 10 + conv;
						j++;
					}
				}
				cout << "\n";
				lc += 12;
			}
			if (cod[i] == 'm' && cod[i + 1] == 'o' && cod[i + 2] == 'v')
			{
				cout << "\n";
				printhexa(lc);
				cout << " ";
				printhexa(50); //opcode of mov
				if (cod[i + 4] == 'E' && cod[i + 5] == 'A' && cod[i + 6] == 'X')
					printhexa(EAX);
				if (cod[i + 4] == 'E' && cod[i + 5] == 'C' && cod[i + 6] == 'X')
					printhexa(ECX);
				if (cod[i + 4] == 'A' && cod[i + 5] == 'C')
					printhexa(AC);
				if (cod[i + 4] == 'D' && cod[i + 5] == 'X')
					printhexa(DX);
				int j = i;
				while (cod[j] != ',')
					j++;
				j++;
				if (cod[j] >= '0' && cod[j] <= '9')
				{
					int conv;
					int print = 0;
					while (1)
					{
						if (cod[j] == ' ' || cod[j] == '\n')
							break;
						else
						{
							conv = cod[j];
							conv -= 48;
							print = print * 10 + conv;
							j++;
						}
					}
					if (print < 16)
					{
						cout << "00000";
					}
					else
					{
						cout << "0000";
					}
					lc += 5;
					printhexa(print);
				}
				else
				{
					if (cod[j] == 'E' && cod[j + 1] == 'A' && cod[j + 2] == 'X')
					{
						if (EAX < 16)
						{
							cout << 0;
						}
						printhexa(EAX);
					}
					if (cod[j] == 'E' && cod[j + 1] == 'C' && cod[j + 2] == 'X')
					{
						if (ECX < 16)
						{
							cout << 0;
						}
						printhexa(ECX);
					}
					if (cod[j] == 'A' && cod[j + 1] == 'C')
					{
						if (AC < 16)
						{
							cout << 0;
						}
						printhexa(AC);
					}
					if (cod[j] == 'D' && cod[j + 1] == 'X')
					{
						if (DX < 16)
						{
							cout << 0;
						}
						printhexa(DX);
					}
					lc = lc + 3;
				}
			}
			if (cod[i] == 'a' && cod[i + 1] == 'd' && cod[i + 2] == 'd')
			{
				cout << "\n";
				printhexa(lc);
				cout << " ";
				printhexa(53); //opcode of add
				if (cod[i + 4] == 'E' && cod[i + 5] == 'A' && cod[i + 6] == 'X')
					printhexa(EAX);
				if (cod[i + 4] == 'E' && cod[i + 5] == 'C' && cod[i + 6] == 'X')
					printhexa(ECX);
				if (cod[i + 4] == 'A' && cod[i + 5] == 'C')
					printhexa(AC);
				if (cod[i + 4] == 'D' && cod[i + 5] == 'X')
					printhexa(DX);
				int j = i;
				while (cod[j] != ',')
					j++;
				j++;
				if (cod[j] >= '0' && cod[j] <= '9')
				{
					int conv;
					int print = 0;
					while (1)
					{
						if (cod[j] == ' ' || cod[j] == '\n')
							break;
						else
						{
							conv = cod[j];
							conv -= 48;
							print = print * 10 + conv;
							j++;
						}
					}
					if (print < 16)
					{
						cout << "00000";
					}
					else
					{
						cout << "0000";
					}
					printhexa(print);
					lc = lc + 5;
				}
				else
				{
					if (cod[j] == 'E' && cod[j + 1] == 'A' && cod[j + 2] == 'X')
					{
						if (EAX < 16)
						{
							cout << 0;
						}
						printhexa(EAX);
					}
					if (cod[j] == 'E' && cod[j + 1] == 'C' && cod[j + 2] == 'X')
					{
						if (ECX < 16)
						{
							cout << 0;
						}
						printhexa(ECX);
					}
					if (cod[j] == 'A' && cod[j + 1] == 'C')
					{
						if (AC < 16)
						{
							cout << 0;
						}
						printhexa(AC);
					}
					if (cod[j] == 'D' && cod[j + 1] == 'X')
					{
						if (DX < 16)
						{
							cout << 0;
						}
						printhexa(DX);
					}
					lc = lc + 3;
				}
			}
			if (cod[i] == 's' && cod[i + 1] == 'u' && cod[i + 2] == 'b')
			{
				cout << "\n";
				printhexa(lc);
				cout << " ";
				printhexa(54); //opcode of sub
				if (cod[i + 4] == 'E' && cod[i + 5] == 'A' && cod[i + 6] == 'X')
					printhexa(EAX);
				if (cod[i + 4] == 'E' && cod[i + 5] == 'C' && cod[i + 6] == 'X')
					printhexa(ECX);
				if (cod[i + 4] == 'A' && cod[i + 5] == 'C')
					printhexa(AC);
				if (cod[i + 4] == 'D' && cod[i + 5] == 'X')
					printhexa(DX);
				int j = i;
				while (cod[j] != ',')
					j++;
				j++;
				if (cod[j] >= '0' && cod[j] <= '9')
				{
					int conv;
					int print = 0;
					while (1)
					{
						if (cod[j] == ' ' || cod[j] == '\n')
							break;
						else
						{
							conv = cod[j];
							conv -= 48;
							print = print * 10 + conv;
							j++;
						}
					}
					if (print < 16)
					{
						cout << "00000";
					}
					else
					{
						cout << "0000";
					}
					printhexa(print);
					lc = lc + 5;
				}
				else
				{
					if (cod[j] == 'E' && cod[j + 1] == 'A' && cod[j + 2] == 'X')
					{
						if (EAX < 16)
						{
							cout << 0;
						}
						printhexa(EAX);
					}
					if (cod[j] == 'E' && cod[j + 1] == 'C' && cod[j + 2] == 'X')
					{
						if (ECX < 16)
						{
							cout << 0;
						}
						printhexa(ECX);
					}
					if (cod[j] == 'A' && cod[j + 1] == 'C')
					{
						if (AC < 16)
						{
							cout << 0;
						}
						printhexa(AC);
					}
					if (cod[j] == 'D' && cod[j + 1] == 'X')
					{
						if (DX < 16)
						{
							cout << 0;
						}
						printhexa(DX);
					}
					lc = lc + 3;
				}
			}
			if (cod[i] == 'd' && cod[i + 1] == 'i' && cod[i + 2] == 'v')
			{
				cout << "\n";
				printhexa(lc);
				cout << " ";
				printhexa(55); //opcode of div
				if (cod[i + 4] == 'E' && cod[i + 5] == 'A' && cod[i + 6] == 'X')
					printhexa(EAX);
				if (cod[i + 4] == 'E' && cod[i + 5] == 'C' && cod[i + 6] == 'X')
					printhexa(ECX);
				if (cod[i + 4] == 'A' && cod[i + 5] == 'C')
					printhexa(AC);
				if (cod[i + 4] == 'D' && cod[i + 5] == 'X')
					printhexa(DX);
				int j = i;
				while (cod[j] != ',')
					j++;
				j++;
				if (cod[j] >= '0' && cod[j] <= '9')
				{
					int conv;
					int print = 0;
					while (1)
					{
						if (cod[j] == ' ' || cod[j] == '\n')
							break;
						else
						{
							conv = cod[j];
							conv -= 48;
							print = print * 10 + conv;
							j++;
						}
					}
					if (print < 16)
					{
						cout << "00000";
					}
					else
					{
						cout << "0000";
					}
					printhexa(print);
					lc = lc + 5;
				}
				else
				{
					if (cod[j] == 'E' && cod[j + 1] == 'A' && cod[j + 2] == 'X')
					{
						if (EAX < 16)
						{
							cout << 0;
						}
						printhexa(EAX);
					}
					if (cod[j] == 'E' && cod[j + 1] == 'C' && cod[j + 2] == 'X')
					{
						if (ECX < 16)
						{
							cout << 0;
						}
						printhexa(ECX);
					}
					if (cod[j] == 'A' && cod[j + 1] == 'C')
					{
						if (AC < 16)
						{
							cout << 0;
						}
						printhexa(AC);
					}
					if (cod[j] == 'D' && cod[j + 1] == 'X')
					{
						if (DX < 16)
						{
							cout << 0;
						}
						printhexa(DX);
					}
					lc = lc + 3;
				}
			}
		}
	}
}