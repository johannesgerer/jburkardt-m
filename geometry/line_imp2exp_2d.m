function [ p1, p2 ] = line_imp2exp_2d ( a, b, c )

%*****************************************************************************80
%
%% LINE_IMP2EXP_2D converts an implicit line to explicit form in 2D.
%
%  Discussion:
%
%    The implicit form of line in 2D is:
%
%      A * X + B * Y + C = 0
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
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
%    Output, real P1(2,1), P2(2,1), two points on the line.
%
  normsq = a * a + b * b;

  if ( normsq == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_IMP2EXP_2D - Fatal error!\n' );
    fprintf ( 1, '  A * A + B * B = 0.\n' );
    error ( 'LINE_IMP2EXP_2D - Fatal error!' );
  end

  p1(1,1) = - a * c / normsq;
  p1(2,1) = - b * c / normsq;

  if ( abs ( b ) < abs ( a ) )
    p2(1,1) = - ( a - b / a ) * c / normsq;
    p2(2,1) = - ( b + 1.0 ) * c / normsq;
  else
    p2(1,1) = - ( a + 1.0 ) * c / normsq;
    p2(2,1) = - ( b - a / b ) * c / normsq;
  end

  return
end
