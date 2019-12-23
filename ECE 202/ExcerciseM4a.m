%Ethan LaFleur
%9/18/19
%ECE 202 Excercise M4 Part A
%Short description: In this excercise we plot a truncated power series

clear
clc

t = linspace(0,6,400); %Creates 400 points from t=0 to t=6
f = 1+t/2-t.^2/3; %Creates function f(t)
plot(t, f, 'LineWidth', 3) %Plots f(t) with a line width of 3
title('ECE 202, Excercise M4, Part(a), Truncated Power Series') %Titles figure
xlabel('time t (s)', 'FontSize', 15) %Sets label for x axis
ylabel('f(t)', 'FontSize', 15) %Sets label for y axis