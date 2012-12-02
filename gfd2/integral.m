function [ val ] = integral ( f, x, m ) 

%*****************************************************************************80
%
%% INTEGRAL estimates the integral of a tabulated function.
%
%  Discussion:
%
%    This function is discussed in chapter 15 of the reference.
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
  val = f(1) * ( x(2) - x(1) );

  for i = 2 : m-1
    val = val + f(i) * ( x(i+1) - x(i-1) );
  end

  val = val + f(m) * ( x(m) - x(m-1) );

  val = val / 2.0;

  return
end
