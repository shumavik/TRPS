#include "stdafx.h"
#include <iostream>
#include <cstdlib>
#include <cstring>
using namespace std;

	struct chislo
	{
	short int num;
	chislo *next;
	};
	struct gnezdo {
	short int kolnum;
	short int *point;
	gnezdo *next;
	};

	
	
int main()
{	
	setlocale(LC_ALL, "Russian");

	//Функции для основного варианта

	void enter_chislo(chislo *c, short int n);  //Ввод списка
	void search(chislo *c,short int s,short const int size);						//Поиск элемента гнездовым способом
	void sort(chislo *c);						//Сортировка методом обмена списка
	void del(chislo *c);						//Удаление списка
	
	const short int size = 11;					//Количество элементов в структуре
	short int massive[size] = {130, 50, 120, 185, 27, 43, 913, 210, 5, 17, 245} ;
	
	//Функции для альтернативного варианта
	void Alt_search (short int *a, short int s,short const int size);	//Поиск элемента в массиве
	void Alt_sort(short int *a, short int size);					//Сортировка массива
	void Alt_del(short int *a, short int size);						//Корректировка элемента в массиве
	


	short int x = 0;
	bool flag = false;

	chislo *number = new chislo;	//Память под элемент списка
	chislo *current = number;		//Указатель на текущий элемент списка
	chislo *h = number;				//Указатель на начало списка


	cout << "Размер структуры chislo:" << sizeof(chislo)<< " байт"<<endl;
	cout << "Размер поля num:" << sizeof(number->num) << " байт" << endl;
	cout << "Размер поля *next:" << sizeof(number->next) << " байт" << endl;

	// Ввод элементов списка
	for (int i = 0; i < size; i++)
	{
		cout << "Enter the number:" ;
		cin >> x;
		cout << endl;

		if (flag == false)
		{
			number->num = x;
			flag = true;
		}

		else
		{
			number = new chislo;
			current->next = number;
			current = number;
			enter_chislo(number,x);		
		}
	}

	cout << "Введите число для поиска:";
	cin >> x;
	cout << endl;

	number = h;
	search(number,x,size);					//Обычный вариант поиска

	Alt_search(massive, x, size);			//Альтернативный вариант поиска


	number = h;

	cout <<" Вывод несортированных элементов "<< endl;
	while (number->next != NULL)  //Вывод несортированных элементов 
	{
		cout<<number->num<<endl;
		number = number->next;
	}
	cout << number->num << endl;

	number = h;
	sort(number);

	cout << " Вывод сортированных элементов " << endl;
	while (number->next != NULL)  //Вывод сортированных элементов списка
	{
		cout << number->num << endl;
		number = number->next;
	}
	cout << number->num << endl;

	//Альтернативная сортировка

	Alt_sort(massive, size);

	number = h;
	/*
	while (number->next != NULL)
	{
		current = number->next;
		del(number);				//Удаление всех элементов
		number = current;
	}
	*/

	del(number);

	
	//Альтернативное удаление

	Alt_del(massive, size);

	system("pause");
    return 0;
}



//Ввод элемента списка
void enter_chislo(chislo *c,short int n)
{	
	c->num = n;
	c->next = NULL;
}



//Гнездовой поиск
void search(chislo *c,short int s,short const int size)
{

	//Для работы с гнездами
	gnezdo *heast = new gnezdo;
	gnezdo *begin = heast;
	gnezdo *hcurrent = heast;
	short const int kheast = 3;

	cout << "Размер структуры gnezdo:" << sizeof(gnezdo) << " байт" << endl;
	cout << "Размер поля kolnum:" << sizeof(heast->kolnum) << " байт" << endl;
	cout << "Размер поля *point:" << sizeof(heast->point) << " байт" << endl;
	cout << "Размер поля *next:" << sizeof(heast->next) << " байт" << endl;

	//Для определения количества элементов
	//удовлетворяющих признаку = кол-во цифр в числе
	short int kone = 0;
	short int ktwo = 0;
	short int kthree = 0;
	short int kol = 0;
	
	//Для работы со списком
	chislo *head = c;
	chislo *current = c;

	//Цикл для того чтобы определить размерность массивов
	for (int i = 0; i < size; i++)
	{
		if (current->num / 10 == 0)
		{
			kone++;
		}
		else
		{
			if (current->num / 100 == 0)
			{
				ktwo++;
			}
			else kthree++;
		}
		current = current->next;
	}

	//Объявляем открытые массивы
	short int *A = new short int[kone];
	short int *B = new short int[ktwo];
	short int *C = new short int[kthree];


	//Соотвествующие индексы массивов
	short int x = 0;  //A[x]
	short int y = 0;  //B[y]
	short int z = 0;  //C[z]


	//Заполнение массивов по признаку
	current = head;

	for (int i = 0; i < size; i++)
	{
		if (current->num / 10 == 0)
		{
			A[x] = current->num;
			x++;
		}
		else
		{
			if (current->num / 100 == 0)
			{
				B[y] = current->num;
				y++;
			}
			else
			{
				C[z] = current->num;
				z++;
			}
		}	
		current = current->next;
	}


	//Создание гнезд
	current = head;

	for (int i = 0; i < kheast; i++)
	{
		heast->kolnum = i+1;
		if (i != kheast-1)
		{
			heast = new gnezdo;
			heast->next = NULL;
			hcurrent->next = heast;
			hcurrent = heast;
		}
	}

	//Выделение признака в числе
	short int priznak = 0;
	short int searcher = s;
	while (searcher != 0)
	{
		searcher /= 10;
		priznak++;
	}
	heast = begin;
	if (priznak == 1)
	{
		heast = begin;
		heast->point = A;
		for (short int i = 0; i < x; i++)
		{
			if (heast->point[i] == s)
			{
				cout << "Найден заданный элемент в гнезде " << heast->kolnum << " с индексом " << i << endl;
				delete[] A;
				delete[] B;
				delete[] C;
				return;
			}

		}
	}
	if (priznak == 2)
	{
			heast = heast->next;
			heast->point = B;
			for (short int i = 0; i < y; i++)
			{
				if (heast->point[i] == s)
				{
					cout << "Найден заданный элемент в гнезде " << heast->kolnum << " с индексом " << i << endl;
					delete[] A;
					delete[] B;
					delete[] C;
					return;
				}

			}
	}
	if (priznak == 3)
	{		
		heast = heast->next;
		heast = heast->next;
			heast->point = C;
			for (short int i = 0; i < z; i++)
			{
				if (heast->point[i] == s)
				{
					cout << "Найден заданный элемент в гнезде " << heast->kolnum << " с индексом " << i << endl;
					delete[] A;
					delete[] B;
					delete[] C;
					return;
				}
			}


	}
	cout << "Заданного элемента нет в исходной структуре данных" << endl;
	return;
}
	
	// Альтернативный поиск
void Alt_search(short int *a, short int s, short const int size) {
	short int i = 0;
	while (i < size) {
		if (a[i] == s) {
			cout << "Элемент " << a[i] << " найден, его индекс в массиве " << i << endl;
			return;
		}
		i++;
	}
	cout << "Заданного элемента нет в массиве" << endl;
	return;
}



//Упорядочивание элементов
void sort(chislo *c)
{	
	bool IsSorted = false;
	short int help = 0;
	chislo *current = c;

	while (IsSorted == false) {
		IsSorted = true;

				while (c->next != NULL)
				{
					c = c->next;

							if ((current->num) < (c->num))
							{
									IsSorted = false;
									help = current->num;
									current->num = c->num;
									c->num = help;
							}
				}
		current = current->next;
		c = current;
	}
}

	//Альтернативная сортировка вставками
void Alt_sort(short int *a,short int size) {
	short int help,prev = 0;
	for (int i = 1; i < size; i++) {
		help = a[i];
		prev = i - 1;
		while (prev >= 0 && a[prev] > help) {
			a[prev + 1] = a[prev];
			a[prev] = help;
			prev--;
		}

	}

	cout << "Альтернативная сортировка" << endl;
	for (int i = 0; i < size; i++) {
		cout << "massive[" << i << "]=" << a[i] << endl;
	}

}












//Удаление элемента
void del(chislo *c)
{
	if (c != NULL)
	{
		chislo *current = c;
		cout << "Элемент " << c->num << " Удален" << endl;
		c = c->next;
		delete current;
	}
	else
		cout << "Все элементы удалены!" << endl;
}

//Альтернативный вариант удаления сдвигом

void Alt_del(short int *a, short int size) {
	int Index_del = 0;
	
	cout << "Введите индекс от 0 до "<<size-1<< endl;
	cin >> Index_del;

	for (int i = Index_del; i < size - 1; i++)
		a[i] = a[i + 1];
	a[size - 1] = 0;

	cout << "Альтернативное удаление" << endl;
	cout << "Был удален элемент " << a[Index_del] << " с индексом " << Index_del << endl;
	for (int i = 0; i < size; i++) {
		cout << "massive[" << i << "]=" << a[i] << endl;
	}

}