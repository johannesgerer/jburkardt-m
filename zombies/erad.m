function [] = erad ( a, b, ze, d, k, T, dt )

% This is the main function in our numerical impulse analysis, used in
% conjunction with eradode.m, which will simulate the eradication of
% zombies. The impulses represent a coordinated attack against zombiekind
% at specified times.
% Function Inputs: a - alpha value in model: "zombie destruction" rate
% b - beta value in model: "new zombie" rate
% ze - zeta value in model: zombie resurrection rate
% d - delta value in model: background death rate
% k - "kill" rate, used in the impulse
% T - Stopping time
% dt - time step for numerical solutions
% Created by Philip Munz, November 21, 2008
%
N = 1000;
%
%  We plan to break the solution into 4 parts with 4 impulses
%
Ti = T/4; 
n = Ti/dt;
m = T/dt;
s = zeros(1,n+1);
z = zeros(1,n+1);
r = zeros(1,n+1);
%
%  The solution vector for all zombie impulses and such
%
sol = zeros(1,m+1); 
t = zeros(1,m+1);
s1 = N;
z1 = 0;
r1 = 0;
%i=0; %i is the intensity factor for the current impulse
%for j=1:n:T/dt
% i = i+1;
% t(j:j+n) = Ti*(i-1):dt:i*Ti;
% sol(j:j+n) = eradode(a,b,ze,d,Ti,dt,s1,z1,r1);
% sol(j+n) = sol(j+n)-i*k*sol(j+n);
% s1 = N-sol(j+n);
% z1 = sol(j+n+1);
% r1 = 0;
%end
sol1 = eradode(a,b,ze,d,Ti,dt,s1,z1,r1);
sol1(n+1) = sol1(n+1)-1*k*sol1(n+1); %347.7975;
s1 = N-sol1(n+1);
z1 = sol1(n+1);
r1 = 0;
sol2 = eradode(a,b,ze,d,Ti,dt,s1,z1,r1);
sol2(n+1) = sol2(n+1)-2*k*sol2(n+1);
s1 = N-sol2(n+1);
z1 = sol2(n+1);
r1 = 0;
sol3 = eradode(a,b,ze,d,Ti,dt,s1,z1,r1);
sol3(n+1) = sol3(n+1)-3*k*sol3(n+1);
s1 = N-sol3(n+1);
z1 = sol3(n+1);
r1 = 0;
sol4 = eradode(a,b,ze,d,Ti,dt,s1,z1,r1);
sol4(n+1) = sol4(n+1)-4*k*sol4(n+1);
s1 = N-sol4(n+1);
z1 = sol4(n+1);
r1 = 0;
sol=[sol1(1:n),sol2(1:n),sol3(1:n),sol4];
t = 0:dt:T;
t1 = 0:dt:Ti;
t2 = Ti:dt:2*Ti;
t3 = 2*Ti:dt:3*Ti;
t4 = 3*Ti:dt:4*Ti;
%plot(t,sol)
hold on
plot(t1(1:n),sol1(1:n),'k')
plot(t2(1:n),sol2(1:n),'k')
plot(t3(1:n),sol3(1:n),'k')
plot(t4,sol4,'k')
hold off
