function p11_title ( )

%*****************************************************************************80
%
%% P11_TITLE prints a title for problem 11.
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
  fprintf ( 1, 'Problem 11\n' );
  fprintf ( 1, '  Name:       Patterson #2, exp(sum(abs(X)))\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = exp ( sum ( abs ( X(i) )))\n' );

  return
end
