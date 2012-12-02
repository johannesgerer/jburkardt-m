function p25_title ( )

%*****************************************************************************80
%
%% P25_TITLE prints a title for problem 10.
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
  fprintf ( 1, 'Problem 25\n' );
  fprintf ( 1, '  Name:       Patterson #3, exp(c*X)\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = exp ( C * product ( X(i) ) )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C, defaults to 0.3.\n' );

  return
end
