function pdf = extreme_values_pdf ( x, a, b )

%*****************************************************************************80
%
%% EXTREME_VALUES_PDF evaluates the Extreme Values PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) =
%      ( 1 / B ) *
%      EXP (
%        ( A - X ) / B - EXP ( ( A - X ) / B  )
%      ).
%
%    The Extreme Values PDF is also known as the Fisher-Tippet PDF
%    and the Log-Weibull PDF.
%
%    The special case A = 0 and B = 1 is the Gumbel PDF.
%
%    The Extreme Values PDF is the limiting distribution for the
%    smallest or largest value in a large sample drawn from
%    any of a great variety of distributions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein, editor,
%    CRC Concise Encylopedia of Mathematics,
%    CRC Press, 1998.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  pdf = ( 1.0 / b ) * exp ( ( a - x ) / b - exp ( ( a - x ) / b ) );

  return
end
