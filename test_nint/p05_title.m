function p05_title ( )

%*****************************************************************************80
%
%% P05_TITLE prints a title for problem 05.
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
  fprintf ( 1, 'Problem 05\n' );
  fprintf ( 1, '  Name:       ST04\n' );
  fprintf ( 1, '              Stroud #4, page 26.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = 1 / ( 1 + sum ( 2 * X(i) ) )\n' );

  return
end
