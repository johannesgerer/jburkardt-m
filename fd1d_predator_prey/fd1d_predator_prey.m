function fd1d_predator_prey ( )

%*****************************************************************************80
%
%% FD1D_PREDATOR_PREY uses finite differences on a 1D predator prey model.
%
%  Discussion
%
%    This function uses a one-dimensional finite-difference method for 
%    Scheme 2 applied to the predator-prey system with Kinetics 1.  
%
%  Author: 
%
%    Marcus Garvie
%

%
% User inputs of parameters
%
  alpha = input('Enter parameter alpha   ');
  beta = input('Enter parameter beta   ');
  gamma = input('Enter parameter gamma   ');
  delta = input('Enter parameter delta   ');
  a = input('Enter a in [a,b]   ');
  b = input('Enter b in [a,b]  ');
  h = input('Enter space-step h   ');
  T = input('Enter maximum time T   ');
  delt = input('Enter time-step Delta t   ');
%
% User inputs of initial data
%
  u0 = input('Enter initial data function u0(x)   ','s'); % see notes
  v0 = input('Enter initial data function v0(x)   ','s'); %   in text
%
% Calculate some constants
%
  mu=delt/(h^2);
  J=round((b-a)/h);
  n = J+1;   % no. of nodes (d.f.) for each dependent variable                        
  N=round(T/delt);
%
% Initialization
%
  u=zeros(n,1); v=zeros(n,1); F=zeros(n,1); G=zeros(n,1);
  y1=zeros(n,1); y2=zeros(n,1); z1=zeros(n,1); z2=zeros(n,1);
  B1=sparse(n,n); B2=sparse(n,n); L=sparse(n,n); Lower1=sparse(n,n);
  Lower2=sparse(n,n); U1=sparse(n,n); U2=sparse(n,n);
%
% Assign initial data
%
  indexI=[1:n]'; 
  x=(indexI-1)*h+a;   % vector of x values on grid
  u = eval(u0).*ones(n,1); v = eval(v0).*ones(n,1);
%
% Construct matrix L (without 1/h^2 factor)
%
  L=sparse(1,2,-2,n,n);
  L=L+sparse(n,n-1,-2,n,n);
  L=L+sparse(2:n-1,3:n,-1,n,n);
  L=L+sparse(2:n-1,1:n-2,-1,n,n);
  L=L+sparse(1:n,1:n,2,n,n);
%
% Construct matrices B1 & B2
%
  B1=sparse(1:n,1:n,1,n,n) + mu*L;
  B2=sparse(1:n,1:n,1,n,n) + delta*mu*L;
%
% Perform the LU factorisation of B1 and B2 
%
  [Lower1,Upper1]=lu(B1);
  [Lower2,Upper2]=lu(B2);
%
% Time-stepping procedure
%
  for nt=1:N
    % Evaluate modified functional response
    hhat = u./(alpha + abs(u));
    % Update right-hand-side of linear system 
    F = u - u.*abs(u) - v.*hhat;
    G = beta*v.*hhat - gamma*v;
    y1 = u + delt*F;
    y2 = v + delt*G;
    % Forward substitution to solve Lower1*z1=y1 for z1
    z1 = Lower1\y1;
    % Back-substitution to solve Upper1*u=z1 for u
    u = Upper1\z1;
    % Forward substitution to solve Lower2*z2=y2 for z2
    z2 = Lower2\y2;
    % Back-substitution to solve Upper2*v=z2 for v
    v = Upper2\z2; 
  end
%
%  Plot solution at time level T=N*delt
%
  plot(x,u,'k'); hold on; plot(x,v,'k-.')

  return
end
