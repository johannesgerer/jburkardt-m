function [pg,xpg,zpg] = bcpgr(rho,x,z)

%*****************************************************************************80
%
%% BCPGR ?
%
%  Discussion:
%
%    This function is discussed in chapter 20 of the reference.
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
%    Input, real RHO(M,N), ?
%
%    Input, real X(M), Z(M,N), the X and Z coordinates.
%
%    Output, PG(M,N), ?
%
%    Output, XPG(M), ZPG(M), the X and Z coordinates associated with PG.
%
  mm=size(rho);
  M=mm(1);
  N=mm(2);

  pg=zeros(M,N);
  xpg=x;
  zpg=z;
  g=9.81;

% On Staggered grid: pg(i,k) is between i and i-1 but on level k
% Density is given in x(i), z(i,k). 
% z=0 at the surface and negative downward

  p=pg;

  for i=1:M
    k=N
    % Top level:  layer thickness above density point up to zero for 
    p(i,k)=rho(i,k)*g*(-z(i,k));
    for k=N-1:-1:1
        p(i,k)=p(i,k+1)+(rho(i,k+1)+rho(i,k))*(z(i,k+1)-z(i,k))*0.5*g;
    end
  end

  for i=2:M
    for k=1:N
      pg(i,k)=(p(i,k)-p(i-1,k))/(x(i)-x(i-1))+(rho(i,k)+rho(i-1,k))*0.5*g*(z(i,k)-z(i-1,k))/(x(i)-x(i-1));
      xpg(i)=(x(i)+x(i-1))/2;
      zpg(i)=(z(i,k)+z(i-1,k))/2;
    end
  end

  pg(1,:)=pg(2,:);

  return
end
