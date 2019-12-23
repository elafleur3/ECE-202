%Ethan LaFleur
%10/25/19
%ECE 202 Excercise M6
%Short description: In this excercise we attempt to find the total number
%of collisions of three carts as well as show that momentum and energy are
%conserved. Then finally we will find the final velocities of the carts. We
%will write a user-defined function to find these final velocities.
%Site with elastic collision equations: HyperPhysics
%Link: http://hyperphysics.phy-astr.gsu.edu/hbase/elacol2.html

clear

%---------- Given Info -----------%

m = [240 120 360]; %Defines array for masses of carts
vi = [30 15 -45]; %Defines array for initial velocities of carts

%---------- Calculations ----------%

%----- First Collision -----%
Pi = sum(m .* vi); %Calculates initial momentum of system
Ei = sum(.5*m.*vi.^2); %Calculates initial kinetic energy of system
[vA(2), vA(3)] = velocities(m(2), m(3), vi(2), vi(3)); %Calculates final velocity of carts 2 and 3 after collision
vA(1) = vi(1) %Outputs new array of velocities
checkP_A = sum(m .* vA)-Pi %Checks to see if the final momentum minus the intial momentum equals 0
checkE_A = sum(.5*m.*vA.^2)-Ei %Checks to see if the final energy minus the initial equals 0

%----- Second Colllision -----%

[vB(1), vB(2)] = velocities(m(1), m(2), vA(1), vA(2)); %Calculates velocity of carts 1 and 2 after collision
vB(3) = vA(3) %Outputs new array of velocities
checkP_B = sum(m .* vB)-Pi %Checks to see if the final momentum minus the intial momentum equals 0
checkE_B = sum(.5*m.*vB.^2)-Ei %Checks to see if the final energy minus the initial equals 0

%----- Third Collision -----%

[vC(2), vC(3)] = velocities(m(2), m(3), vB(2), vB(3)); %Calculates final velocity of carts 2 and 3 after collision
vC(1) = vB(1) %Outputs new array of velocities after the collision
checkP_C = sum(m .* vC)-Pi %Checks to see if the final momentum minus the intial momentum equals 0
checkE_C = sum(.5*m.*vC.^2)-Ei %Checks to see if the final energy minus the initial equals 0

%----- Fourth Collision -----%

[vD(1), vD(2)] = velocities(m(1), m(2), vC(1), vC(2)); %Calculates velocity of carts 1 and 2 after collision
vD(3) = vC(3) %Outputs new array of velocities after the collision
checkP_D = sum(m .* vD)-Pi %Checks to see if the final momentum minus the intial momentum equals 0
checkE_D = sum(.5*m.*vD.^2)-Ei %Checks to see if the final energy minus the initial equals 0

%---------- Explanation ----------%
%There are no more collisions that will occur. The way that we know this is
%by looking at the velocities. The velocity of cart three is positive
%meaning that it is going to the right. The other two velocities are
%negative meaning they are going to the left so cart 3 cannot collide  with
%the other 2. We know that carts 1 and 2 will never collide because the
%carts are traveling in the same direction and the cart on the outside has
%a larger velocity than the cart on the inside, meaning they will never
%collide. 

%---------- Function ----------%

function [v1f,v2f] = velocities(m1, m2, vi1, vi2) %Creates 2 output function with inputs of the carts 
    M = m1+m2; %Calculates total mass for specific collision
    v1f = ((m1-m2)*vi1+2*m2*vi2)/M; %Calculates final velocity of cart 1
    v2f = (2*m1*vi1+vi2*(m2-m1))/M; %Calculates final velocity of cart 2
end %ends function