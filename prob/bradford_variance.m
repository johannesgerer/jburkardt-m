function variance = bradford_variance ( a, b, c )
 
%*****************************************************************************80
%
%% BRADFORD_VARIANCE returns the variance of the Bradford PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    A < B,
%    0.0 < C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( b - a )^2 * ...
    ( c * ( log ( c + 1.0 ) - 2.0 ) + 2.0 * log ( c + 1.0 ) ) ...
    / ( 2.0 * c * ( log ( c + 1.0 ) )^2 );

  return
end
