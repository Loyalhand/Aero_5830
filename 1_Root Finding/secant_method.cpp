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
double sec(double x0, double x1) {
	
	double deriv = (func(x1)-func(x0))/(x1-x0);
	return deriv;
}

// Function to find the root using newtons method 
int secant_method(double x0, double x1) {

    double xold, h, iter = 0;
    

	while (abs(func(x1)-func(x0)) >= EPSILON)
	{
		h = func(x1)/sec(x0, x1);

		// x(i+1) = x(i) - f(x) / f'(x)
        xold = x1;
		x1 = x1 - h;
        x0 = xold;
        iter++;
        cout << "The value of the root is : " << x0 << "\t" << x1;
        cout << endl;

	}

	cout << "The value of the root is : " << x1;
    cout << endl;
    cout << "number of iterations is : " << iter;
}

// Driver program to test above
int main()
{
	char m;
	double x0, x1; // Initial values assumed
	cout << "Enter initial guess: ";
	cin >> x0;
    cin >> x1;
	
	secant_method(x0, x1);
	cin >> m;

	return 0;
}
