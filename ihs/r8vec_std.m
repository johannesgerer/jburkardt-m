function std = r8vec_std ( n, a )

%*****************************************************************************80
%
%% R8VEC_STD returns the standard deviation of an R8VEC.
%
%  Discussion:
%
%    The standard deviation of a vector X of length N is defined as
%
%      mean ( X(1:n) ) = sum ( X(1:n) ) / n
%
%      std ( X(1:n) ) = sqrt ( sum ( ( X(1:n) - mean )**2 ) / ( n - 1 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%    N should be at least 2.
%
%    Input, real A(N), the vector.
%
%    Output, real STD, the standard deviation of the vector.
%
  if ( n < 2 )

    std = 0.0;

  else

    mean = sum ( a(1:n) ) / n;

    std = sum ( ( a(1:n) - mean ).^2 );

    std = sqrt ( std / ( n - 1 ) );

  end

  return
end
