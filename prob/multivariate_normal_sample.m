function [ x, seed ] = multivariate_normal_sample ( n, mean, covar_factor, seed )

%*****************************************************************************80
%
%% MULTIVARIATE_NORMAL_SAMPLE samples the Multivariate Normal PDF.
%
%  Discussion:
%
%    PDF ( Mean(1:N), S(1:N,1:N); X(1:N) ) = 1 / ( 2 * pi * det ( S ) )^(N/2) 
%      * exp ( - ( X - Mean )' * inverse ( S ) * ( X - Mean ) / 2 )
%
%    Here, 
%
%      X is the argument vector of length N,
%      Mean is the mean vector of length N,
%      S is an N by N positive definite symmetric covariance matrix.
%
%    The properties of S guarantee that it has a lower triangular
%    matrix L, the Cholesky factor, such that S = L * L'.  It is the
%    matrix L, rather than S, that is required by this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jerry Banks, editor,
%    Handbook of Simulation,
%    Engineering and Management Press Books, 1998, page 167.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real MEAN(N), the mean vector.
% 
%    Input, real COVAR_FACTOR(N,N), the lower triangular Cholesky
%    factor L of the covariance matrix S.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), a sample point of the distribution.
%
  for i = 1 : n

    [ z, seed ] = normal_01_sample ( seed );

    x(i) = mean(i);

    for j = 1 : i
      x(i) = x(i) + covar_factor(i,j) * z;
    end

  end

  return
end
