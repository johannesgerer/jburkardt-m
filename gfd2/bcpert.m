function [ f ] = bcpert ( f )

%*****************************************************************************80
%
%% BCPERT makes a copy of an array with certain "boundary conditions".
%
%  Discussion:
%
%    The output array is a copy of the input array, except that
%    row M-1 was copied to row 1, row 2 was copied to row M, and columns
%    1 and N were zeroed out.  This is suggested by the following diagram:
%
%      0 52 53 54 55  0   <- Row M-1 copied here
%      0 22 23 24 25  0
%      0 32 33 34 35  0
%      0 42 43 44 45  0
%      0 52 53 54 55  0
%      0 22 23 24 25  0   <- Row 2 copied here
%
%      Columns 1 and N zeroed out.
%
%    This function is discussed in chapter 17 of the reference.
%
%  Modified:
%
%    08 December 2009
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
%    Input, real F(M,N), the array to be modified.
%
%    Output, real F(M,N), the modified array.
%
  val = size ( f );
  M = val(1);
  N = val(2);

  f(1,:) = f(M-1,:);
  f(:,1) = 0;
  f(M,:) = f(2,:);
  f(:,N) = 0;

  return
end
