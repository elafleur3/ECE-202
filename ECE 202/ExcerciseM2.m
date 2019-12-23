%Ethan LaFleur
%9/12/19
%ECE 202 Excercise M2
%Short description: In this excercise we attempt to find the specific mass
%of a car that results in it stopping after an elastic collision
%Site with elastic collision equations: HyperPhysics
%Link: http://hyperphysics.phy-astr.gsu.edu/hbase/elacol2.html

clear
clc

%----------- Given Info ----------%

v1i=30; %Initial velocity of cart 1 -> 30 cm/s to the right
v2i=-30; %Initial velocity of cart 2 -> 30 cm/s to the left
m2=150; %mass of cart 2 -> 150 g
v1f=0; %Final velocity of cart 1 -> 0 cm/s

%---------- Calculations ----------%

m1=m2*(2*v2i-v1i-v1f)/(v1f-v1i) %calculates mass of cart 1 in g
M=m1+m2;
v2f=(2*m1*v1i+v2i*(m2-m1))/M %calculates final velocity of cart 2 in cm/s

%---------- Check Answers ----------%

Pi=m1*v1i+m2*v2i; %Finds initial momentum of whole system
Pf=m1*v1f+m2*v2f; %Finds final momentum of whole system
checkP=Pf-Pi %Checks to see if the final momentum minus the initial comes out to 0
KEi=.5*m1*v1i^2+.5*m2*v2i^2; %Finds initial kinetic energy of system
KEf=.5*m1*v1f^2+.5*m2*v2f^2; %Finds final kinetic energy of system
checkKE=KEf-KEi %Checks to see if the final kinetic energy minus the initial comes out to 0
check_v1f=((m1-m2)*v1i+2*m2*v2i)/M %checks to see if final velocity of cart 1 comes out to 0 like it should

%The result of our experiment matches the design criterion as expected