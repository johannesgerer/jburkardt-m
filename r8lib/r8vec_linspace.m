function x = r8vec_linspace ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_LINSPACE creates a vector of linearly spaced values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    While MATLAB has the built in command 
%
%      x = linspace ( a, b, n )
%
%    that command has the distinct disadvantage of returning a ROW vector.
%
%    4 points evenly spaced between 0 and 12 will yield 0, 4, 8, 12.
%
%    In other words, the interval is divided into N-1 even subintervals,
%    and the endpoints of intervals are used as the points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A, B, the first and last entries.
%
%    Output, real X(N), a vector of linearly spaced data.
%
  x = zeros ( n, 1 );

  if ( n == 1 )
    x(1,1) = ( a + b ) / 2.0;
  else
    x = ( linspace ( a, b, n ) )';
  end

  return
end
