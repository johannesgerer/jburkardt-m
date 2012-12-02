function p20_title ( )

%*****************************************************************************80
%
%% P20_TITLE prints a title for problem 20.
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
  fprintf ( 1, 'Problem 20\n' );
  fprintf ( 1, '  Name:       Sum^P\n' );
  fprintf ( 1, '  Region:     A <= X(i) <= B\n' );
  fprintf ( 1, '  Integrand:  F(X) = ( sum ( X(i) ) )^p\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              A, defaults to 0.0.\n' );
  fprintf ( 1, '              B, defaults to 1.0.\n' );
  fprintf ( 1, '              P, defaults to 2.0.\n' );

  return
end
