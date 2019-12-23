%Ethan LaFleur
%10/3/19
%ECE 202 Midterm 1
%Short description: We see if a sum of terms can be rewritten as a ratio of
% polynomials

clear
clc
clf

%----- Calculations/Givens -----%
xmin = -3.99999; %Value to avoid is -4 so we set the min to something very close to it
xmax = 2.999999; %Value to avoid is 3 so we set the max to be something close 
x = linspace(xmin, xmax, 400); %generates points for x
f1x = 2./(x-3); %Creates f1(x) function
f2x = 7./(x+4); %Creates f2(x) function
fxr = (9*x-13)./(x.^2+x-12); %Creates fr(x) function in ratio of two polynomials form

%----- Checks -----%

check1 = fxr-(f1x+f2x); %Checks difference between the sum of the two given functions and the ratio of the two polynomials. Should be an array of zeroes.
check2 = sum(abs(check1)) %Adds up all absolute values in check1 matrix to see how close it is to 0. Should come out close to 0.

%----- Plotting -----%

plot(x, f1x, 'r:', x, f2x, 'g--', x, fxr, 'b', x, check1, 'm') %Plots all four functions
ylim([-10 10]) %sets limits of y axis
legend('Function f1(x)', 'Function f2(x)', 'Ratio of two polynomials fr(x)', 'Ratio-sum: fr(x)-(f1(x)+f2(x))') %adds a legend
title('ECE 202, Exam 1, Ratio of two polynomials vs. a sum', 'FontSize', 24) %Gives the graph a title
xlabel('X', 'FontSize', 15) %Sets label for x axis
ylabel('Functions f1(x), f2(x), fr(x)', 'FontSize', 15) %set label for y axis

%The reason that we need to avoid these 2 numbers are because it makes the
%graph undefined at this point. If it makes the graph undefined at these
%points and we ask matlab to graph it, it could cause some errors like
%possibly a long wait time or it may not graph the whole figure period.