%Ethan LaFleur
%9/18/19
%ECE 202 Excercise M4 Part C
%Short description: In this excercise we plot a normal gaussian function

clear
clc

x = linspace(0, 10, 400); %Creates 400 points from x=0m to x=10m
P = 1/(2*sqrt(pi))*exp(-(x-5).^2/4); %Creates the function P(x)
plot(x, P, '--') %Plots P(x) in a dotted line
title('ECE 202, Excercise M4, Part(c), Normalized Gaussian', 'FontSize', 24) %Titles figure
xlabel('distance x (m)', 'FontSize', 18) %Sets label for x axis
ylabel('P(x)', 'FontSize', 18) %Sets label for y axis
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); %Makes figure larger to fit font
