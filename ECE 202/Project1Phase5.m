%Ethan LaFleur
%10/21/19
%ECE 202 Project 1 Phase 5
%Short Description: In this phase we are letting the user define some of
%our variables

clear
clf
format shortG

%---------- Givens ----------%
A = 12; %amplitude of given sinusoid
w = 40; %frequency of given sinusoid
nzero = input('Up to how many non-zero terms should in the power series expansion? ') ; %number of non-zero terms
tmin = 0; %min time value in ms
tmax = input('Maximum time value for the plot in ms? '); %max time value is ms
N = 400; %number of points to plot

%---------- Calculations ----------%

n=[0:2:2*nzero-1]; %creates n array for all non zero terms 
a=(A*w.^(n).*(-1).^(n/2))./factorial(n); %creates array of coefficients used for a
aout = transpose([n; a;]) %creates nice output for n and a_n
t=linspace(tmin, tmax, N); %creates array of 400 from t=0 to t=200 ms
ts = t/1000; %creates time array in seconds
ft0=a(1)*ts.^n(1); %creates f(t) for n=0
ft1=a(2)*ts.^n(2)+ft0; %creates f(t) for n=2
ft2=a(3)*ts.^n(3)+ft1; %creates f(t) for n=4
ft3=a(4)*ts.^n(4)+ft2; %creates f(t) for n=6
ft4=a(5)*ts.^n(5)+ft3; %creates f(t) for n=8
ft5=a(6)*ts.^n(6)+ft4; %creates f(t) for n=10

subtotal = zeros(1,N); %creates dummy variable for the for loop
for m = 1:nzero %for loop from 1 to number of nonzero terms

    subtotal = subtotal + a(m)*ts.^n(m); %adds previous subtotal to next term
    p = plot(t, subtotal); %plots functions
    hold on %makes all plots appear on graph

end

%---------- Plotting ----------%

p.LineWidth = 3; %makes last function thicker than the others
ylim([-A-A/4,A+A/4]) %sets limits of y axis
ax = gca;
ax.FontSize = 15;
grid on
title({'ECE 202, Project 1, Phase 5:', ... %Puts title on figure
    [num2str(A), 'cos(', num2str(w), 't) approximated by a power series, up to ', num2str(nzero), ' non-zero terms in the power series expansion']}, ...
    'FontSize', 20)
xlabel("time t (ms)", 'FontSize', 24) %puts label on x axis
ylabel("f(t)", 'FontSize', 24) %puts label on y axis
legend("Up to n = " +n,'location', 'eastoutside', 'FontSize', 18) %Puts legend on the figure

%---------- Phase 3 Visual Check ----------%

%I have changed all the things that have been hardwired to not being
%hardwired. The output and figure are the exact same still. 

%---------- Phase 4 Check ----------%

check = sum(abs(subtotal-ft5)) %Checks that for loop output is the same as the previous way, should be zero

%---------- Phase 5 Visual Check -----------%
 
%After changing the two variables to user inputs, I ran the script with the
%values that we have been using. The graph was the same and everything
%updated such as the title for the graph. I then tried it with 8 non zero
%terms and everything updated. The only thing that was wrong was the check
%and that is because it has not been updated for more or less terms.