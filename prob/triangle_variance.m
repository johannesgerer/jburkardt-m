function variance = triangle_variance ( a, b, c )

%*****************************************************************************80
%
%% TRIANGLE_VARIANCE returns the variance of the Triangle PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    A <= B <= C and A < C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( ( c - a ) * ( c - a ) ...
             - ( c - a ) * ( b - a ) ...
             + ( b - a ) * ( b - a ) ) / 18.0;

  return
end
