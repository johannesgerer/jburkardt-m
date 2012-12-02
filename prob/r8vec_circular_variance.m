function value = r8vec_circular_variance ( n, x )

%*****************************************************************************80
%
%% R8VEC_CIRCULAR_VARIANCE returns the circular variance of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 December 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real X(N), the vector whose variance is desired.
%
%    Output, real VALUE, the circular variance of the vector entries.
%
  mean = r8vec_mean ( n, x );

  value = ( sum ( cos ( x(1:n) - mean ) ) ).^2 ...
        + ( sum ( sin ( x(1:n) - mean ) ) ).^2;

  value = sqrt ( value ) / n;

  value = 1.0 - value;

  return
end
