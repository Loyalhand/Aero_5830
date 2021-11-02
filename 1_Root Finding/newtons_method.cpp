// C++ program for implementation of Newton Raphson Method for
// solving equations
#include<bits/stdc++.h>
#define EPSILON 0.0001
using namespace std;

// function to solve 
double func(double x) {
	return x*x-2*x;
}

// Derivative of the above function using a central difference approximation (4th order)
double derivFunc(double x) {
	double h = 10^-11;
	double deriv = (-func(x+2*h) + 8*func(x+h) - 8*func(x-h) + func(x-2*h))/(12*h);
	return deriv;
}

// Function to find the root using newtons method 
int newtonRaphson(double x) {
	double h = func(x) / derivFunc(x);
    int iter = 0;

	while (abs(h) >= EPSILON)
	{
		h = func(x)/derivFunc(x);

		// x(i+1) = x(i) - f(x) / f'(x)
		x = x - h;
        iter++;

	}

	cout << "The value of the root is : " << x;
    cout << endl;
    cout << "number of iterations is : " << iter;
}

// Driver program to test above
int main()
{
	char m;
	double x0; // Initial values assumed
	cout << "Enter initial guess: ";
	cin >> x0;
	
	newtonRaphson(x0);
	cin.get();

	return 0;
}
