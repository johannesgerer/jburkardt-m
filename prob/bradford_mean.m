function mean = bradford_mean ( a, b, c )

%*****************************************************************************80
%
%% BRADFORD_MEAN returns the mean of the Bradford PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = ( c * ( b - a ) + log ( c + 1.0 ) * ( a * ( c + 1.0 ) - b ) ) ...
    / ( c * log ( c + 1.0 ) );

  return
end
