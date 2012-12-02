function p04_title ( )

%*****************************************************************************80
%
%% P04_TITLE prints a title for problem 04.
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
  fprintf ( 1, 'Problem 04\n' );
  fprintf ( 1, '  Name:       HexSum\n' );
  fprintf ( 1, '              Davis, Rabinowitz, page 370, #2.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = ( sum ( 2 * X(i) - 1 ) )^6\n' );

  return
end
