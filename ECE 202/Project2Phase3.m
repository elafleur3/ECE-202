% Ethan LaFleur
% 11/7/19
% ECE 202 Project 2 Phase 3
% Short description: In this project we calculate the components of the
% baseballs first without drag, and next with drag. In Phase 3 we calculate
% the time of flight of the baseball

clear
clf

% ----- givens -----%

x0 = 0; y0 = 0;  % because we really don't care where it starts
v0mph = 112;  % exit velocity, in mph
phi0deg = 32;   % launch angle, in degrees
g = 10;   % gravitional constant
m = .145; %mass of a baseball in kg
Pair = 1.225; %density of air in kg/m^3
A = pi*(.0375)^2; %cross sectional area of a baseball in m^2
C = input('Value for C? '); %asks user for value of C (dimensionless constant)
DragC = .5*C*Pair*A; %common factor for Drag force

% ----- useful variables -----%

mph2mps = 5280 * 12 * 2.54 / 100 / 3600; %variable for changing from mph to m/s
deg2rad = pi()/180; %variable for changing angle from degrees to radians
m2ft = 3.2808; %variable from going from meters to ft

v0 = v0mph * mph2mps;   % exit velocity, in m/s 
phi0 = phi0deg * deg2rad;   % launch angle in rad

v0x = v0 * cos(phi0);   % x-component of v0, in m/s
v0y = v0 * sin(phi0);   % y-component of v0, in m/s


% ----- useful characteristics of trajectory -----%

tH = v0y/g;    % time to reach max. height H, in s 
t_land = 2*tH;    % time to land (assuming flat ground), in s

H = v0y^2/2/g*m2ft;    % maximum height, in m
R =v0x * t_land * m2ft;  % range of baseball (where it lands), in ft


% ----- set up a time array and compute x(t) and y(t) -----

tmin = 0; tmax = t_land;   % stop when the ball lands
N = 2000;   % intervals
t = linspace(tmin, tmax, 1+N);   % time array, connects x(t) and y(t)

xt = x0 + v0x*t;   % x(t), ax = 0 (no drag)
yt = y0 + v0y*t - 1/2 *g*t.^2;   % y(t), ay = -g (no drag)


% ----- numerical solution -----%

dt = (tmax - tmin)/N; %amiubt of time changing between each point of xt and yt
x = zeros(1, 1+N); %initialize x(t)
y = zeros(1, 1+N); % initialize y(t)
x(1) = x0; %First x position
vx = v0x; %Initial x velocity
y(1) = y0; %First y position
vy = v0y;   % Initial y velocity

for n = 1:N   % stop at N
    
    v = sqrt(vx^2+vy^2); %calculates magnitude of the velocity of the baseball
    Fx = -DragC*v*vx; %x component of force on baseball
    Fy = -m*g-DragC*v*vy; %y component of force on baseball
    ax = Fx/m; %x component of acceleration
    ay = Fy/m; %y component of acceleration
    x(n+1) = x(n)+vx*dt+.5*dt^2*ax; %next x position
    y(n+1) = y(n)+vy*dt+.5*ay*dt^2; %next y position
    vx = vx+ax*dt; %next x component of velocity
    vy = vy+ay*dt; %next y component of velocity
    
end


% ----- check analytic vs. numeric -----%

y = y*m2ft; %Converts y from meters to ft
yt = yt*m2ft; %Converts yt from meters to ft
x = x*m2ft; %Converts x from meters to ft
xt = xt*m2ft; %Converts xt from meters to ft
checkSumX = sum(abs(x-xt)) %Checks to see that analytical and numerical solutions of xt are equal. Should be zero or very small number
checkSumY = sum(abs(y-yt)) %Checks to see that analytical and numerical solutions of yt are equal. Should be zero or very small number
                          
% ----- plotting -----%

plot(xt, yt, x, y, 'LineWidth', 2)  %Plots both functions
grid on %turns on grid

ax = gca;
ax.FontSize = 16;   % change the font size for everything

legend({'No Drag', ... %Gives figure a legend
    ['Drag with C=' num2str(C)]}, 'FontSize', 18)

xlabel('x (ft)', 'FontSize', 18) %Gives x axis a label
ylabel('y (ft)', 'FontSize', 18) %Gives y axis a label

title({'ECE 202, Project 2, Phase 3:', ... %Puts title on figure
    'Trajectory of a baseball, comparing no drag vs. drag'}, ...
    'FontSize', 21)

ylim([0, 150])  % add space below and above %sets y axis boundaries

%---------- Exporting ----------%

export = transpose([t; x; y]);
dlmwrite('Project2.csv', export)