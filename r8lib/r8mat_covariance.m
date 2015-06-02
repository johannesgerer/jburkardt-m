function c = r8mat_covariance ( m, n, x )

%*****************************************************************************80
%
%%  R8MAT_COVARIANCE computes the sample covariance of a set of vector data.
%
%  Discussion:
%
%    MATLAB provides the cov() function, but its conventions are different.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2013
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer M, the size of a single data vectors.
%
%    Input, integer N, the number of data vectors.
%    N should be greater than 1.
%
%    Input, real X(M,N), an array of N data vectors, each
%    of length M.
%
%    Output, real C(M,M), the covariance matrix for the data.
%

%
%  Special case of N = 1.
%
  if ( n == 1 )
    c = eye ( m, m );
    return
  end

  c = zeros ( m, m );
%
%  Determine the sample means along columns (dimension 2).
%
  x_mean = mean ( x, 2 );
%
%  Determine the sample covariance.
%
  for j = 1 : m
    for i = 1 : m
      for k = 1 : n
        c(i,j) = c(i,j) + ( x(i,k) - x_mean(i) ) * ( x(j,k) - x_mean(j) );
      end
    end
  end

  c(1:m,1:m) = c(1:m,1:m) / ( n - 1 );

  return
end