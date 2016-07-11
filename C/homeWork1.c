#include<stdio.h>

float totalMoney(float p, int n){

	        return p*n;

}

int isSpecielNum(int n){

	int a,b,c,d;

	a = n/1000;
	b = n%1000/100;
	c = n%100/10;
	d = n%10;

	printf("a = %d, b = %d, c = %d, d = %d",a,b,c,d);
	printf("\n");
	if((a == b && b== c) || (b == c && c == d) || (a == b && c == d)|| ((a - b)==(b - c) && (b - c) == (c - d))){
		return 1;
	}else{
		return 0;
	}
	
}


int main(){


	int num;

	scanf("%d",&num);
	printf("%d\n",isSpecielNum(num));


		printf("num = %d\n",num);

	/*
	float price = 3.0;
	int num = 4;

	scanf("%f %d",&price, &num);

	printf("总价格是：%.2f\n",totalMoney(price,num));
*/
	return 0;
}

