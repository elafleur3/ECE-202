%Ethan LaFleur
%11/4/19
%ECE 202 Excercise M7
%Short description: In this excercise we calculate and plot (in one figure
%with subplots) the current, voltage, and power of a circuit as functions
%of time. Then we check to see if the total power absorbed equals the total
%energy stored in the inductor.

clear
clf

%---------- Givens ----------%
v0 = 10; %Given voltage is 10 volts by the voltage source
R = 2; %Given resistance is 2 ohms
L = 50; %Given inductance is 50 mH 
tau = L/R; %time constant tau = L/R in ms
iFinal = v0/R; %Computes current after a very long time or "final current"
tmin = 0; %min t value in ms
tmax = 10*tau; %finds max t value in ms
N = 400; %number of points

%---------- Plotting ----------%

t = linspace(tmin,tmax,N+1); %Makes array of time values in ms
it = iFinal*(1-exp(-t/tau)); %Makes array of current values from t=0 to t=10tau (in Amps)
vt = v0*exp(-t/tau); %Makes array of voltage values from t=0 to t=10tau (in Volts)
pt = it.*vt; %Makes array of power values from t=0 to t=10tau (in Watts)
subplot(3, 1, 1) %selects subplot 1
plot(t, it, 'b') %plots i(t)
title({'ECE 202, Excercise M7:',...
'Current, Voltage, and Power absorbed for a charging inductor as functions of time'},...
'FontSize', 22) %titles the figure
ylabel('Current (A)', 'FontSize', 18) %sets y label of subplot
text(200, 1, '$$ i(t)=5(1-e^{-t\over25}) $$', 'Interpreter', 'latex', 'Fontsize', 24) %Gives subtitle to subplot
subplot(3, 1, 2) %selects subplot 2
plot(t, vt, 'r') %plots v(t)
ylabel('Voltage (V)', 'FontSize', 18) %sets y label of subplot
text(200, 8, '$$ v(t)=10e^{-t\over25} $$', 'Interpreter', 'latex', 'Fontsize', 24) %Gives subtitle to subplot
subplot(3, 1, 3) %selects subplot 3
plot(t, pt, 'k') %plots p(t)
ylabel('Power absorbed (W)', 'FontSize', 18) %gives y label to subplot
xlabel('time t, ms', 'FontSize', 24) %gives x label to plots
text(200, 12, '$$ p(t)=i(t)*v(t) $$', 'Interpreter', 'latex', 'Fontsize', 24)%Gives subtitle to subplot

%---------- Checks ----------%
Wtotal = .5*L*iFinal^2 %calculates total energy stored in the inductor (in millijoules)
dt = (tmax-tmin)/N; %calculates dt for integration (in ms)
Wabs = sum(pt*dt) %calculates total energy absorbed (in millijoules)
check = Wtotal-Wabs %checks to see if the difference between the two is 0
pdif = check/(Wtotal+Wabs)*200 %calculates percent difference of pa and w