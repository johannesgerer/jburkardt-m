function circle_sector_print_2d ( r, center, theta1, theta2 )

%*****************************************************************************80
%
%% CIRCLE_SECTOR_PRINT_2D prints a circular sector in 2D.
%
%  Discussion:
%
%    A circular sector is formed by a circular arc, and the two straight line
%    segments that join its ends to the center of the circle.
%
%    A circular sector is defined by
%
%      ( X - CENTER(1) )**2 + ( Y - CENTER(2) )**2 = R**2
%
%    and
%
%      Theta1 <= Theta <= Theta2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
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
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circular sector definition:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Radius = %f\n', r );
  fprintf ( 1, '    Center = %f  %f\n', center(1:2,1) );
  fprintf ( 1, '    Theta  = %f  %f\n', theta1, theta2 );

  return
end
