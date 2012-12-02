function [NS,MS] = NSMS(rho,u,v,z) 

%*****************************************************************************80
%
%% NSMS ?
%
%  Discussion:
%
%    This function is discussed in chapter 14 of the reference.
%
%  Modified:
%
%    30 November 2009
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


% Assumes staggered grod NS and MS(k) in (k-1/2)

  vv=size(rho);
  M=vv(2);

  for k=2:M
    MS(k)=((u(k)-u(k-1))/(z(k)-z(k-1)))^2+((v(k)-v(k-1))/(z(k)-z(k-1)))^2;
    NS(k)=-((rho(k)-rho(k-1))/(z(k)-z(k-1)))*9.81/1028;
  end

  MS(1)=MS(2);
  NS(1)=NS(2);

  return
end
