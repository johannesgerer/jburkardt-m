function variance = pareto_variance ( a, b )

%*****************************************************************************80
%
%% PARETO_VARIANCE returns the variance of the Pareto PDF.
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
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( b <= 2.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARETO_VARIANCE - Warning!\n' );
    fprintf ( 1, '  For B <= 2, the variance does not exist.\n' );
    variance = 0.0;
    return
  end

  variance = a * a * b / ( ( b - 1.0 )^2 * ( b - 2.0 ) );

  return
end
