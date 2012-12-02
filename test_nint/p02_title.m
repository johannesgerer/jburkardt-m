function p02_title ( )

%*****************************************************************************80
%
%% P02_TITLE prints a title for problem 02.
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
  fprintf ( 1, 'Problem 02\n' );
  fprintf ( 1, '  Name:       QuadSum\n' );
  fprintf ( 1, '              Davis, Rabinowitz, page 370, #1.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = ( sum ( 2 * X(i) - 1 ) )^4\n' );

  return
end
