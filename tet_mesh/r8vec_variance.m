function variance = r8vec_variance ( n, x )

%*****************************************************************************80
%
%% R8VEC_VARIANCE returns the variance of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
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
%    Output, real VARIANCE, the variance of the vector entries.
%
  mean = r8vec_mean ( n, x );

  variance = sum ( ( x(1:n) - mean ).^2 );

  if ( 1 < n )
    variance = variance / ( n - 1 );
  else
    variance = 0.0;
  end 

  return
end
