function a = wishart_sample_inverse ( m, df, sigma )

%*****************************************************************************80
%
%% WISHART_SAMPLE_INVERSE returns the inverse of a sample Wishart matrix.
%
%  Discussion:
%
%    This function requires functions from the PDFLIB and RNGLIB libraries.
%
%    The "initialize()" function from RNGLIB must be called before using
%    this function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Patrick Odell, Alan Feiveson,
%    A numerical procedure to generate a sample covariance matrix,
%    Journal of the American Statistical Association,
%    Volume 61, Number 313, March 1966, pages 199-203.
%
%    Stanley Sawyer,
%    Wishart Distributions and Inverse-Wishart Sampling,
%    Washington University,
%    30 April 2007, 12 pages.
%
%  Parameters:
%
%    Input, integer M, the order of the matrix.
%
%    Input, integer DF, the number of degrees of freedom.
%    M <= DF.
%
%    Input, real SIGMA(M,M), the covariance matrix, which should be 
%    a symmetric positive definite matrix.
%
%    Output, real A(M,M), the inverse of a sample matrix from the Wishart 
%    distribution.
%
  if ( df < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WISHART_SAMPLE_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  DF = %d < M = %d.\n', df, m );
    error ( 'WISHART_SAMPLE_INVERSE - Fatal error!\n' );
  end
%
%  Get R, the upper triangular Cholesky factor of SIGMA.
%
  r = chol ( sigma );
%
%  Get S, the inverse of R.
%
  s = r8ut_inverse ( m, r );
%
%  Get UA, the inverse of a sample from the unit Wishart distribution.
%
  ua = wishart_unit_sample_inverse ( m, df );
%
%  Construct the matrix A = S * UA * S'.
%
  a = s * ua * s';

  return
end
