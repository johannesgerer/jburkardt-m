function [ X,t ] = rk4 ( fun, par, x0, t0, dt, N )

%*****************************************************************************80
%
%% RK4: 4th order Runge Kutta ODE solver.
%
%  Discussion:
%
%    This function implements the 4th order Runge-Kutta method for solving 
%    a system of ordinary differential equations.
%
%    This function is discussed in chapter 22 of the reference.
%
%    The function FUN must be a MATLAB function returning a vector of the
%    same size as X0, with with declaration "function [f] = fun(x,par)".
% 
%    Note that if time is needed as an argument in the function, you can 
%    use an augmented state vector.
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
%    Input, function f = FUN ( x, par ), a string with the name of 
%    the function which evaluates the right hand side of the differential
%    equations.
%
%    Input, real PAR(:), a vector of parameters of the function.  
%    PAR may be empty.
%
%    Input, real X0(:), the initial condition.
%
%    Input, real T0, the initial time.
%
%    Input, real DT, the time increment.
%
%    Input, integer N, the number of time steps to perform.
%
%    Output, real X(N+1,:), the computed solution vector containing the 
%    N+1 time steps, including the initial condition.
%
%    Output, real t(N+1), the time of the corresponding solution.
%
  M=max(size(x0));
  X=zeros(N+1,M);
  t=zeros(1,N+1);
  X(1,:)=x0;
  t(1)=t0;

  for n=1:N
    tt=t(n);
    xx=X(n,:);
    f = feval(fun,xx,par);
    k1=dt*f;
    f=feval(fun,xx+k1/2,par);
    k2=dt*f;
    f=feval(fun,xx+k2/2,par);
    k3=dt*f;
    f=feval(fun,xx+k3,par);
    k4=dt*f;
    X(n+1,:)=X(n,:)+(k1+2*k2+2*k3+k4)/6;
    t(n+1)=t(n)+dt;
  end

  return
end
