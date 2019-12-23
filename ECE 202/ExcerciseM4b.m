%Ethan LaFleur
%9/18/19
%ECE 202 Excercise M4 Part B
%Short description: In this excercise we plot a shifted sinusoid function

clear
clc

t = linspace(-5, 5, 400); %Creates 400 points from t=-5 to t=5
g = 4*cos(3*(t-2)); %Defines the function g(t)
plot(t, g, 'r') %Plots g(t)
axis([-inf inf -6 6]) %Sets limits of both axis
title('ECE 202, Excercise M4, Part(b), Shifted Sinusoid') %Titles figure
xlabel('time t (s)', 'FontSize', 15) %Sets label for x axis
ylabel('g(t)', 'FontSize', 15) %Sets label for y axis