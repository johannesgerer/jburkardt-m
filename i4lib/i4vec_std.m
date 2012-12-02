function std = i4vec_std( n, x )

%*****************************************************************************80
%
%% I4VEC_STD returns the standard deviation of an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 August 2009
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
%    Output, real STD, the standard deviation of the vector entries.
%
  if ( n < 2 )

    std = 0.0;

  else

    mean = sum ( x(1:n) ) / n;

    std = sum ( ( x(1:n) - mean ).^2 );

    std = sqrt ( std / ( n - 1 ) );

  end 

  return
end
