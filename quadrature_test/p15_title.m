function p15_title ( )

%*****************************************************************************80
%
%% P15_TITLE prints a title for problem 15.
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
  fprintf ( 1, 'Problem 15\n' );
  fprintf ( 1, '  Name:       Partial product ( X(1:N) )\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = product ( X(1:N) )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              N, defaults to 1\n' );

  return
end
