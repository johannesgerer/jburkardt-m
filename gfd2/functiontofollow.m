function [ val ] = functiontofollow ( x ) 

%*****************************************************************************80
%
%% FUNCTIONTOFOLLOW evaluates a function which is to be linearly interpolated.
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
  val = tanh ( x );

  return
end
