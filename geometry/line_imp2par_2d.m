function [ f, g, x0, y0 ] = line_imp2par_2d ( a, b, c )

%*****************************************************************************80
%
%% LINE_IMP2PAR_2D converts an implicit line to parametric form in 2D.
%
%  Discussion:
%
%    The implicit form of line in 2D is:
%
%      A * X + B * Y + C = 0
%
%    The parametric form of a line in 2D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%
%    We normalize by choosing F*F+G*G=1 and 0 <= F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real A, B, C, the implicit line parameters.
%
%    Output, real F, G, X0, Y0, the parametric parameters of
%    the line.
%
  if ( a * a + b * b == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_IMP2PAR_2D - Fatal error!\n' );
    fprintf ( 1, '  A * A + B * B = 0.\n' );
    error ( 'LINE_IMP2PAR_2D - Fatal error!' );
  end

  x0 = - a * c / ( a * a + b * b );
  y0 = - b * c / ( a * a + b * b );

  f =   b / sqrt ( a * a + b * b );
  g = - a / sqrt ( a * a + b * b );

  if ( f < 0.0 )
    f = -f;
    g = -g;
  end

  return
end
