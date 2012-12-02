function [ xn, yn ] = updatex ( ip, KM, x, y, u, v, dt )

%*****************************************************************************80
%
%% UPDATEX updates particle positions using Euler's method.
%
%  Discussion:
%
%    This function is discussed in chapter 10 of the reference.
%
%  Modified:
%
%    01 December 2009
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
  for k = 1 : KM
    for i = 1 : ip
      xn(i,k) = x(i,k) + u(i,k) * dt;
      yn(i,k) = y(i,k) + v(i,k) * dt;
    end
  end

  for k = 1 : KM
    xn(ip+1,k) = xn(1,k);
    yn(ip+1,k) = yn(1,k);
  end

  return
end
