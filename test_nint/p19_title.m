function p19_title ( )

%*****************************************************************************80
%
%% P19_TITLE prints a title for problem 19.
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
  fprintf ( 1, 'Problem 19\n' );
  fprintf ( 1, '  Name:       Sqrt-Prod\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = prod ( sqrt ( | X(i) - Z(i) | ) )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to (1/3,1/3,...,1/3)\n' );

  return
end
