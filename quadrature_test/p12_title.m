function p12_title ( )

%*****************************************************************************80
%
%% P12_TITLE prints a title for problem 12.
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
  fprintf ( 1, 'Problem 12\n' );
  fprintf ( 1, '  Name:       BFN02\n' );
  fprintf ( 1, '              Bratley, Fox, Niederreiter, #2\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = product ( i * cos ( X(i) ) )\n' );

  return
end
