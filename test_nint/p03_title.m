function p03_title ( )

%*****************************************************************************80
%
%% P03_TITLE prints a title for problem 03.
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
  fprintf ( 1, 'Problem 03\n' );
  fprintf ( 1, '  Name:       QuintSum\n' );
  fprintf ( 1, '              Davis, Rabinowitz, page 370, #3.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = ( sum ( X(i) ) )^5\n' );

  return
end
