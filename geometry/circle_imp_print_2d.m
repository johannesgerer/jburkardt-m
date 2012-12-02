function circle_imp_print_2d ( r, center, title )

%*****************************************************************************80
%
%% CIRCLE_IMP_PRINT_2D prints an implicit circle in 2D.
%
%  Discussion:
%
%    An implicit circle in 2D satisfies:
%
%      ( X - CENTER(1) )^2 + ( Y - CENTER(2) )^2 = R^2
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
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2,1), the center of the circle.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius = %f\n', r );
  fprintf ( 1, '  Center = %f  %f\n', center(1:2,1) );

  return
end
