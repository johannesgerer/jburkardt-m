function mean = f_mean ( m, n )

%*****************************************************************************80
%
%% F_MEAN returns the mean of the F central PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2004
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
%    Note, however, that the mean is not defined unless 3 <= N.
%
%    Output, real MEAN, the mean of the PDF.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_MEAN - Fatal error!\n' );
    fprintf ( 1, '  The mean is not defined for N < 3.\n' );
    error ( 'F_MEAN - Fatal error!' );
  end

  mean = n / ( n - 2 );

  return
end
