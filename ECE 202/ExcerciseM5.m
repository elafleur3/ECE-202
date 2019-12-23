%Ethan LaFleur
%9/18/19
%ECE 202 Excercise M5
%Short description: In this excercise we show that the product of two
%sinusoids can be shown by the sum of two sinusoids

clear
clc

%---------- Calculations ----------%

tms = linspace(0, 200, 400); %Creates 400 points from t=0ms to t=200ms
t = tms/1000; %Converts tms array from ms to s for equation
A = 60*t-1.8; %Creates variable A for formulas
B = 100*t+1.2; %Creates Variable B for formulas
K=12; %Defines coefficient K
f = K*cos(A).*cos(B); %Creates f(t) function
fA = K/2*cos(A+B); %Creates function for first sinusoid to be added
fB = K/2*cos(A-B); %Creates function for second sinusoiid to be add

%---------- Checks ----------%

check1 = f-(fA+fB); %Creates array that is the difference between the two waves being added and the actual wave
check2 = sum(abs(check1)) %Sums all the absolute values in the check1 array and it should come out close to 0 if the values in check1 are close to 0
%We are using the absolute value function because we are looking to see the
%total amount our numbers  are away from 0. If we didn't use the absolute
%value function then the negative numbers would cancel out the positive
%ones and give us a value closer to zero than it actually is.

%----------- Plotting ----------%

plot(tms, f, 'r', tms, fA, 'g', tms, fB, 'b', tms, check1, 'm') %Plots all four functions
legend('Product of 2 sinusoids, f(t)', 'Function fA(t)', 'Function fB(t)', 'Product-Sum') %Makes legend
title('ECE 202, Excercise M5, Product of Two Sinusoids to Sum of Two Sinusoids', 'FontSize', 10) %Titles figure
xlabel('time t (ms)', 'FontSize', 15) %Sets label for x axis
ylabel('Functions f(t), fA(t), fB(t)', 'FontSize', 15) %Sets label for y axis