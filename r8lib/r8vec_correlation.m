function correlation = r8vec_correlation ( n, x, y )

%*****************************************************************************80
%
%% R8VEC_CORRELATION returns the correlation of two R8VEC's.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    If X and Y are two nonzero vectors of length N, then
%
%      correlation = (x/||x||)' (y/||y||)
%
%    It is the cosine of the angle between the two vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vectors.
%
%    Input, real X(N), Y(N), the vectors to be convolved.
%
%    Output, real CORRELATION, the correlation of X and Y.
%
  x_norm = norm ( x(1:n) );
  y_norm = norm ( y(1:n) );
  xy_dot = x(1:n)' * y(1:n);

  if ( x_norm == 0.0 || y_norm == 0.0 )
    correlation = 0.0;
  else
    correlation = xy_dot / x_norm / y_norm;
  end

  return
end
