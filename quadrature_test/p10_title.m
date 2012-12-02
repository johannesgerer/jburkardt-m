function p10_title ( )

%*****************************************************************************80
%
%% P10_TITLE prints a title for problem 10.
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
  fprintf ( 1, 'Problem 10\n' );
  fprintf ( 1, '  Name:       Patterson #4\n' );
  fprintf ( 1, '              Stroud, page ?\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = sum ( abs ( X(i) - 0.5 ) )\n' );

  return
end
