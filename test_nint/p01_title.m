function p01_title ( )

%*****************************************************************************80
%
%% P01_TITLE prints a title for problem 01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
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
  fprintf ( 1, 'Problem 01\n' );
  fprintf ( 1, '  Name:       SquareSum\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = ( sum ( X(i) ) )^2\n' );

  return
end
