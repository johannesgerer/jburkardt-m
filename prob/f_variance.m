function variance = f_variance ( m, n )

%*****************************************************************************80
%
%% F_VARIANCE returns the variance of the F central PDF.
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
%    Input, integer M, N, the parameters of the PDF.
%    1 <= M,
%    1 <= N.
%    Note, however, that the variance is not defined unless 5 <= N.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( n < 5 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  The variance is not defined for N < 5.\n' );
    error ( 'F_VARIANCE - Fatal error!' );
  end

  variance = 2 * n * n * ( m + n - 2 ) / ( m * ( n - 2 )^2 * ( n - 4 ) );

  return
end
