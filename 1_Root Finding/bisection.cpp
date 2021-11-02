//bisection method
#include<bits/stdc++.h>
#include <iostream>
using namespace std;

// An example function whose solution is determined using
// Bisection Method. The function is x^3 - x^2 + 2
double func(double x)
{
	return x*x*x - x*x + 2;
}

// Function to find the root
void bisection(double xmid, double xstart, double xend) {

	for (int i = 0; i < 11; i++)
	{
		double fstart = func(xstart);
        double fmid = func(xmid);
        //double fend = func(xend);
        if (func(xmid) == 0) { 
                break;
            }

        if (fstart*fmid < 0) {

            xend = xmid;
            xmid = (xmid + xstart)/2;
            xstart = xstart;

        } else {
            xstart = xmid;
            xmid = (xmid + xend)/2;
            xend = xend;
        }
	}

	cout << "The value of the root is : " << xmid;
    cout << endl;
    cout << "The value of the function at this location is: " << func(xmid);

}

// Driver program to test above
int main()
{
    char m;
	double xstart;
    double xend;
    double guess;
    cout << "Enter the lower bound: ";
    cin >> xstart;
    cout << endl;
    cout << "Enter the upper bound: ";
    cin >> xend;
    cout << endl;
    cout << "Enter the initial guess: ";
    cin >> guess;
    cout << endl;
	bisection(guess, xstart, xend);
    cin >> m;

	return 0;
}
