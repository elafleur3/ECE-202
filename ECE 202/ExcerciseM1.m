%Ethan LaFleur
%9/9/19
%ECE 202 Excercise M1
%Short description: In this excercise we attempt to find the final
%velocities of two cars after an elastic collision
%Site with elastic collision equations: HyperPhysics
%Link: http://hyperphysics.phy-astr.gsu.edu/hbase/elacol2.html

clear
clc

%---------- Given Info -----------%

v1i=40; %Initial velocity of cart 1 -> 40 cm/s to the right
v2i=-30; %Initial velocity of cart 2 -> 30 cm/s to the left
m1=250; %mass of cart 1 -> 250 g
m2=150; %mass of cart 2 -> 150 g
M=m1+m2; %Total  mass

%---------- Calculations ----------%

v1f=((m1-m2)*v1i+2*m2*v2i)/M %calculates final velocity of cart 1 in cm/s
v2f=(2*m1*v1i+v2i*(m2-m1))/M %calculates final velocity of cart 2 in cm/s
Pi=m1*v1i+m2*v2i; %Finds initial momentum of whole system
Pf=m1*v1f+m2*v2f; %Finds final momentum of whole system
KEi=.5*m1*v1i^2+.5*m2*v2i^2; %Finds initial kinetic energy of system
KEf=.5*m1*v1f^2+.5*m2*v2f^2; %Finds final kinetic energy of system

%---------- Check Answers ----------%

checkP=Pf-Pi %Checks to see if the final momentum minus the initial comes out to 0
checkKE=KEf-KEi %Checks to see if the final kinetic energy minus the initial comes out to 0