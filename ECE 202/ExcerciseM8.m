%Ethan LaFleur
%11/6/19
%ECE 202 Excercise M8
%Short description: In this excercise we use matrix functions to solve help
%us use partial fraction expansion on a ratio of polynomials.

clear

%---------- Calculations ----------%

A = [6 3 2; -5 -4 -3; 1 1 1]; %Creates the coefficient matrix of the three equations involving c1 c2 and c3
b = [6; 5; 4]; %Creates matrix of answers for solving the coefficient matrix
c = A^(-1)*b %Creates matrix of values for c1 c2 and c3
prompt = 'Number of points in x array? '; %Creates variable for the prompt to be asked when program runs
n = input(prompt); %asks user for number of points in n array
x = linspace(-4,4,n); %creates x array based on inputted n value
D1x = x-1; %Creates array for all values of one root from x=-4 to x=4
D2x = x-2; %Creates array for all values of one root from x=-4 to x=4
D3x = x-3; %Creates array for all values of one root from x=-4 to x=4
Rx = (b(3)*x.^2+b(2)*x+b(1))./(D1x.*D2x.*D3x); %Calculates original function values of R(x)
R1x = c(1)./D1x; %Function for part of partial function
R2x = c(2)./D2x; %Function for part of partial function
R3x = c(3)./D3x; %Function for part of partial function

%---------- Checks ----------%

check = sum(abs(R1x+R2x+R3x-Rx)) %Checks that ratio of polynomials equals partial fraction expansion of the ratio. Should be zero or very small number

%In this excercise we can see that some numbers are not
%allowed to be inputted for n. We can see that starting at 5 every fourth
%number after is not allowed to be chosen for n. This is because when n is
%chosen at these specific numbers it creates the numbers for x using linspace, it
%includes one of the roots of the function. For example when 5 is chosen
%one of the numbers in the x array is 2, which is a root of the function
%and makes it undefined, thus causing an error in matlab.