function [ f ] = periodic ( f )

%*****************************************************************************80
%
%% PERIODIC enforces periodicity in an array.
%
%  Discussion:
%
%    This function returns a copy of the array in which the rows 1 and 2
%    equal rows M-1 and M, and columns 1 and 2 equal columns N-1 and N.
%
%    This function is discussed in chapter 16 and 18 of the reference.
%
%  Modified:
%
%    03 December 2009
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
%    Input, real F(M,N), the array.
%
%    Output, real F(M,N), a periodic version of the array.
%
  val = size ( f );

  M = val(1);
  N = val(2);

  f(1,:) = f(M-1,:);
  f(:,1) = f(:,N-1);
  f(M,:) = f(2,:);
  f(:,N) = f(:,2);

  return
end
