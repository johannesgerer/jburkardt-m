function mean = pareto_mean ( a, b )

%*****************************************************************************80
%
%% PARETO_MEAN returns the mean of the Pareto PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real MEAN, the mean of the PDF.
%
  if ( b <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARETO_MEAN - Fatal error!\n' );
    fprintf ( 1, '  For B <= 1, the mean does not exist.\n' );
    mean = 0.0;
    return
  end

  mean = b * a / ( b - 1.0 );

  return
end
