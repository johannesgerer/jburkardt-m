function [ val ] = windstress ( t ) 

%*****************************************************************************80
%
%% WINDSTRESS computes the wind stress.
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
  if ( 3 * 2 * pi / 0.0001 < t )
    val = 0;
  else
    val = 0.001 * 20 * 20;
  end

  return
end
