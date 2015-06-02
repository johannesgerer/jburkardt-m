function t = bartlett_unit_sample ( m, df )

%*****************************************************************************80
%
%% BARTLETT_UNIT_SAMPLE samples the unit Bartlett distribution.
%
%  Discussion:
%
%    If the matrix T is sampled from the unit Bartlett distribution, then 
%    the matrix W = T' * T is a sample from the unit Wishart distribution.
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
%    11 October 2013
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
%    Output, real T(M,M), the sample matrix from the unit Bartlett distribution.
%
  if ( df < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BARTLETT_UNIT_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  DF = %d < M = %d.\n', df, m );
    error ( 'BARTLETT_UNIT_SAMPLE - Fatal error!\n' );
  end

  t = zeros ( m, m );
  
  for i = 1 : m - 1
    df_chi = df - i + 1;
    t(i,i) = sqrt ( r8_chi_sample ( df_chi ) );
    for j = i + 1 : m
      t(i,j) = r8_normal_01_sample ( );
    end
  end

  return
end
