function [ x, seed ] = square01_sample ( n, seed )

%*****************************************************************************80
%
%% SQUARE01_SAMPLE samples points in the unit square in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real X(2,N), the points.
%
  m = 2;

  [ x, seed ] = r8mat_uniform_01 ( m, n, seed );

  return
end
