function x = r8vec_midspace ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_MIDSPACE creates a vector of linearly spaced values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    While MATLAB has the built in command 
%
%      x = linspace ( a, b, n )
%
%    that command has the distinct disadvantage of returning a ROW vector,
%    and the first and last entries are a and b respectively.
%
%    This function divides the interval [a,b] into n subintervals, and then
%    returns the midpoints of those subintervals.
%
%  Example:
%
%    N = 5, A = 10, B = 20
%    X = [ 11, 13, 15, 17, 19 ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A, B, the endpoints of the interval.
%
%    Output, real X(N,1), a vector of linearly spaced data.
%
  if ( n == 1 )
    x = ( a + b ) / 2.0;
  else
    a2 = a + ( b - a ) / 2.0 / n;
    b2 = b - ( b - a ) / 2.0 / n;
    x = ( linspace ( a2, b2, n ) )';
  end

  return
end
