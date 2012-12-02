function pdf = gumbel_pdf ( x )

%*****************************************************************************80
%
%% GUMBEL_PDF evaluates the Gumbel PDF.
%
%  Discussion:
%
%    PDF(X) = EXP ( - X - EXP ( - X  ) ).
%
%    GUMBEL_PDF(X) = EXTREME_PDF(X)(0,1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
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
%    Output, real PDF, the value of the PDF.
%
  pdf = exp ( - x - exp ( - x ) );

  return
end
