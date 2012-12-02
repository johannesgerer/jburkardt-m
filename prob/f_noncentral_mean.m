function mean = f_noncentral_mean ( a, m, n )

%*****************************************************************************80
%
%% F_NONCENTRAL_MEAN returns the mean of the F noncentral PDF.
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
%    Note, however, that the mean is not defined unless 3 <= N.
%
%    Output, real MEAN, the mean of the PDF.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_NONCENTRAL_MEAN - Fatal error!\n' );
    fprintf ( 1, '  The mean is not defined for N < 3.\n' );
    error ( 'F_NONCENTRAL_MEAN - Fatal error!' );
  end

  mean = ( m + a ) * n  / ( m * ( n - 2 ) );

  return
end
