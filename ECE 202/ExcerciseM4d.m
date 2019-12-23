%Ethan LaFleur
%9/18/19
%ECE 202 Excercise M4 Part C
%Short description: In this excercise we plot three dampings for parallel
%RLC

clear
clc

tms = linspace(0, 40, 400); %Creates 400 points from t=0ms to t=40ms
t = tms/1000; %Converts tms array from ms to s for equations
v1 = 16*exp(-800*t)-4*exp(-200*t); %Calculates v1(t)
v2 =exp(-500*t).*(12-6000*t); %Calculates v2(t)
v3 = exp(-120*t).*(12*cos(450*t)-5*sin(450*t)); %Calculates v3(t)
plot(tms, v1, 'r', tms, v2, 'g', tms, v3, 'b') %Plots three functions
legend('overdamped v1', 'critically damped v2', 'underdamped v3') %Makes legend
title('ECE 202, Excercise M4, Part(d), Three dampings for parallel RLC') %Titles figure
xlabel('time t (ms)', 'FontSize', 15) %Sets label for x axis
ylabel('voltage v (V)', 'FontSize', 15) %Sets label for y axis





