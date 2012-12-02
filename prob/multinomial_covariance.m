function covariance = multinomial_covariance ( a, b, c )

%*****************************************************************************80
%
%% MULTINOMIAL_COVARIANCE returns the covariances of the Multinomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of trials.
%
%    Input, integer B, the number of outcomes possible on one trial.
%    1 <= B.
%
%    Input, real C(B).  C(I) is the probability of outcome I on
%    any trial.
%    0.0 <= C(I) <= 1.0,
%    Sum ( 1 <= I <= B) C(I) = 1.0.
%
%    Output, real COVARIANCE(B,B), the covariance matrix.
%
  for i = 1 : b
    for j = 1 : b

      if ( i == j )
        covariance(i,j) = a * c(i) * ( 1.0 - c(i) );
      else
        covariance(i,j) = - a * c(i) * c(j);
      end

    end
  end

  return
end
