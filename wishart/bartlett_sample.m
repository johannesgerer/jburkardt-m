function t = bartlett_sample ( m, df, sigma )

%*****************************************************************************80
%
%% BARTLETT_SAMPLE samples the Bartlett distribution.
%
%  Discussion:
%
%    If the matrix T is sampled from the Bartlett distribution, then 
%    the matrix W = T' * T is a sample from the Wishart distribution.
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
%    26 July 2013
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
%    Output, real T(M,M), the sample matrix from the Bartlett distribution.
%
  if ( df < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BARTLETT_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  DF = %d < M = %d.\n', df, m );
    error ( 'BARTLETT_SAMPLE - Fatal error!\n' );
  end
%
%  Get the upper triangular Cholesky factor of SIGMA.
%
  r = chol ( sigma );
%
%  Sample the unit Bartlett distribution.
%
  tu = bartlett_unit_sample ( m, df );
%
%  Construct the matrix.
%
  t = tu * r;

  return
end
