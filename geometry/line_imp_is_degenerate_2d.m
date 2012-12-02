function value = line_imp_is_degenerate_2d ( a, b, c )

%*****************************************************************************80
%
%% LINE_IMP_IS_DEGENERATE_2D finds if an implicit point is degenerate in 2D.
%
%  Discussion:
%
%    The implicit form of a line in 2D is:
%
%      A * X + B * Y + C = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the implicit line parameters.
%
%    Output, logical VALUE, is true if the line is degenerate.
%
  value = ( a * a + b * b == 0.0 );

  return
end
