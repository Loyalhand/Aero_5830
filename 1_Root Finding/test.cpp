#include <iostream>
using namespace std;

class MyClass {        // The class
  public:              // Access specifier
  float a;
    void assignValues();
    void getCoefficients();   // Method/function declaration
};

// Method/function definition outside the class
void MyClass::assignValues(){
  cin >> a;
  return;
}

void MyClass::getCoefficients() {
  cout << a;
  return;
}

int main() {
  MyClass funct;
  funct.assignValues();
  funct.getCoefficients();
  return 0;
}