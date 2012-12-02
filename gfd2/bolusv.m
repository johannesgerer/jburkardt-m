function [ ubol, wbol, S ] = bolusv ( rho, kappa, dx, dz )

%*****************************************************************************80
%
%% BOLUSV computes the bolus velocities and slope.
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
  val = size(rho);
  M = val(1);
  N = val(2);
%
% C staggering assumed
% rho centered
% u left
% w below
% S (relative slope) corner
%
  S = zeros(M,N);

  for i=2:M
    for k=2:N
      S(i,k) = - kappa * ( rho(i,k) - rho(i-1,k) + rho(i,k-1) - rho(i-1,k-1) ) ...
                       / ( rho(i,k) - rho(i,k-1) + rho(i-1,k) - rho(i-1,k-1) ) * dz / dx;
    end
  end

  ubol=zeros(M,N);
  wbol=zeros(M,N);

  for i=1:M-1
    for k=1:N-1
      ubol(i,k) = - ( S(i,k+1) - S(i,k) ) / dz;
      wbol(i,k) = + ( S(i+1,k) - S(i,k) ) / dx;
    end
  end

  return
end
