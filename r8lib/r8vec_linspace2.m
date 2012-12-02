function x = r8vec_linspace2 ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_LINSPACE2 creates a vector of linearly spaced values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    4 points evenly spaced between 0 and 12 will yield 2, 4, 6, 8, 10.
%
%    In other words, the interval is divided into N+1 even subintervals,
%    and the endpoints of internal intervals are used as the points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2012
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
%    Output, real X(N,1), a vector of linearly spaced data.
%
  x = zeros ( n, 1 );

  for i = 1 : n
    x(i) = ( ( n  - i + 1 ) * a ...
           + (      i     ) * b ) ...
           / ( n      + 1 );
  end

  return
end
