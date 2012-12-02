%% CHAOS explores solutions to the Lorenz equations.
%
%  Discussion:
%
%    This is a script which uses RK4 and LORENZ to explore solutions to
%    the Lorenz equations.
%
%    This script is discussed in chapter 22 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
clear all;
close all;

NMAX=4000;
NS=NMAX/5;
dt=0.01;
%
% create an initial condition which is already on the attractor:
%
  nini=5000;
  [XXxx,t]=rk4(@lorenz,[10,28,8/3],[1 1 1],0,dt,nini);
  plot(XXxx(:,1),XXxx(:,3))
  disp('Press "Enter" to see the next figure.');
  pause;
  disp('Wait ...');


x0=[XXxx(nini,1),XXxx(nini,2),XXxx(nini,3)];
[XX,t]=rk4(@lorenz,[10,28,8/3],x0,0,dt,NMAX);
[XXP,t]=rk4(@lorenz,[10,28,8/3],x0+[0.01,0,0],0,dt,NMAX);
[XXe,t]=rk4(@lorenz,[10,28,9/3],x0+[0,0,0],0,dt,NMAX);
plot(XX(:,1),XX(:,3))
axis off
print -deps lorenz1.eps
disp('Press "Enter" to see the next figure.');
pause;
disp('Wait ...');


plot(t,XX(:,1),t,XXP(:,1))
axis([0 15 -20 20])
print -deps lorenz2.eps
disp('Press "Enter" to see the next figure.');
pause;
disp('Wait ...');


for k=1:NMAX+1
    diff(k)=norm([XX(k,1)-XXP(k,1),XX(k,2)-XXP(k,2),XX(k,3)-XXP(k,3)]);
end
plot(t,log(diff))
axis([0 15 -6 4])
print -deps lorenz3.eps
disp('Press "Enter" to see the next figure.');
pause;
disp('Wait ...');


corr=zeros(NS+1,1);
corr2=corr;
corr3=corr;
for ii=0:NS
    N=NMAX-ii;
    N1=1+ii;
    N2=N1+N-1;
    xori=XX(1:N,1);
    xshifted=XX(N1:N2,1);
    xori=xori-mean(xori);
    xshifted=xshifted-mean(xshifted);
    zz=corrcoef(xori,xshifted);
    corr(ii+1)=zz(1,2);
    xori=XX(1:N,2);
    xshifted=XX(N1:N2,2);
    zz=corrcoef(xori,xshifted);
    corr2(ii+1)=zz(1,2);
    xori=XX(1:N,3);
    xshifted=XX(N1:N2,3);
    zz=corrcoef(xori,xshifted);
    corr3(ii+1)=zz(1,2);
    tt(ii+1)=(ii-1)*dt;
end
plot(tt,corr)%,tt,corr2,tt,corr3)
axis([0 5 -.2 1])
print -deps lorenz5.eps
disp('Press "Enter" to see the next figure.');
pause;
disp('Wait ...');


% some skills in function of lead time:
% persistence
% climatology=average
climate=mean(XX);
for k=1:NMAX+1
    errper(k)=norm([XX(k,1)-x0(1),XX(k,2)-x0(2),XX(k,3)-x0(3)]);
    errclim(k)=norm([XX(k,1)-climate(1),XX(k,2)-climate(2),XX(k,3)-climate(3)]);
    errinit(k)=norm([XX(k,1)-XXP(k,1),XX(k,2)-XXP(k,2),XX(k,3)-XXP(k,3)]);
    errmodel(k)=norm([XX(k,1)-XXe(k,1),XX(k,2)-XXe(k,2),XX(k,3)-XXe(k,3)]);
    Delta(k)=(k-1)*dt;
    skillinit(k)=1-errinit(k)/errper(k);
    skillmodel(k)=1-errmodel(k)/errper(k);
    skillinitcl(k)=1-errinit(k)/errclim(k);
    skillmodelcl(k)=1-errmodel(k)/errclim(k);
end
plot(Delta,skillinit,Delta,skillinitcl)
axis([0 10 -1 1])
print -deps lorenz4.eps
disp('Press "Enter" to see the next figure.');
pause;
disp('Wait ...');


plot(Delta,skillmodel)
axis([0 10 -1 1])
disp('Press "Enter" to see the next figure.');
pause;
disp('Wait ...');


plot(Delta,skillinitcl)
axis([0 10 -1 1])
disp('Press "Enter" to see the next figure.');
pause;


plot(Delta,skillmodelcl)
axis([0 10 -1 1])
