function variance = i4vec_variance ( n, x )

%*****************************************************************************80
%
%% I4VEC_VARIANCE returns the variance of an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer X(N), the vector whose variance is desired.
%
%    Output, real VARIANCE, the variance of the vector entries.
%
  if ( n < 2 )

    variance = 0.0;

  else

    mean = sum ( x(1:n) ) / n;

    variance = sum ( ( x(1:n) - mean ).^2 );

    variance = variance / ( n - 1 );

  end 

  return
end
