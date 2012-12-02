function p17_title ( )

%*****************************************************************************80
%
%% P17_TITLE prints a title for problem 17.
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
  fprintf ( 1, 'Problem 17\n' );
  fprintf ( 1, '  Name:       L2(X-Z)^2\n' );
  fprintf ( 1, '              Zero at point Z.\n' );
  fprintf ( 1, '              Radially symmetric.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = sum ( ( X(i) - Z(i) )^2 )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to (0.5,0.5,...)\n' );

  return
end
