function p22_title ( )

%*****************************************************************************80
%
%% P22_TITLE prints a title for problem 22.
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
  fprintf ( 1, 'Problem 22\n' );
  fprintf ( 1, '  Name:       BallMonomial\n' );
  fprintf ( 1, '  Region:     Sphere interior, radius R, center 0\n' );
  fprintf ( 1, '  Integrand:  F(X) = C * product ( X(i)^E(i) )\n' );
  fprintf ( 1, '  Parameters:\n' ); 
  fprintf ( 1, '              C, defaults to 1.0.\n' );
  fprintf ( 1, '              R, defaults to 1.0.\n' );
  fprintf ( 1, '              E(1:DIM_NUM) defaults to 2.\n' );

  return
end
