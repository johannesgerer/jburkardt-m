function [ n1, n2 ] = grid_shape_2d ( n, a )

%*****************************************************************************80
%
%% GRID_SHAPE_2D guesses the shape N1 by N2 of a vector of data.
%
%  Discussion:
%
%    The data vector A is assumed to contain N1 * N2 values,
%    where each of N2 values is repeated N1 times.
%
%  Example:
%
%    Input:
%
%      A = ( 2, 2, 2, 7, 7, 7 )
%
%    Output:
%
%      N1 = 3, N2 = 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real A(N), the data, which should have the properties
%    described above.
%
%    Output, integer N1, N2, the "shape" of the data in the array.
%

%
%  Make a guess for N1.
%
  i = 1;
  n1 = 1;

  for i = 2 : n
    if ( a(i) ~= a(1) )
      break
    end
    n1 = n1 + 1;
  end
%
%  Guess that N2 = N / N1.
%
  n2 = floor ( n / n1 );

  return
end
