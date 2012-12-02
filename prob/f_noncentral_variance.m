function variance = f_noncentral_variance ( a, m, n )

%*****************************************************************************80
%
%% F_NONCENTRAL_VARIANCE returns the variance of the F noncentral PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, a parameter of the PDF.
%
%    Input, integer M, N, parameters of the PDF.
%    1 <= M,
%    1 <= N.
%    Note, however, that the variance is not defined unless 5 <= N.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( n < 5 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_NONCENTRAL_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  The variance is not defined for N < 5.\n' );
    error ( 'F_NONCENTRAL_VARIANCE - Fatal error!' );
  end

  variance = ( ( m + a )^2 + 2.0 * ( m + a ) * n * n ) 
    / ( ( n - 2.0 ) * ( n - 4.0 ) * m * m ) - 
    ( m + a )^2 * n * n / ( ( n - 2.0 )^2 * m * m );

  return
end
