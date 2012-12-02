function p18_title ( )

%*****************************************************************************80
%
%% P18_TITLE prints a title for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Problem 18\n' );
  fprintf ( 1, '  Name:       Disk\n' );
  fprintf ( 1, '              Disk of radius R centered at Z.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = sphere interior characteristic\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              R, defaults to 0.5\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to (0.5,0.5,...0.5)\n' );

  return
end
