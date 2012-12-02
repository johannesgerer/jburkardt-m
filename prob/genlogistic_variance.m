function variance = genlogistic_variance ( a, b, c )

%*****************************************************************************80
%
%% GENLOGISTIC_VARIANCE returns the variance of the Generalized Logistic PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = b * b * ( pi * pi / 6.0 + trigamma ( c ) );

  return
end
