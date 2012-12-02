function p08_title ( )

%*****************************************************************************80
%
%% P08_TITLE prints a title for problem 08.
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
  fprintf ( 1, 'Problem 08\n' );
  fprintf ( 1, '  Name:       RC01\n' );
  fprintf ( 1, '              Crandall, page 49, #1\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = sin^2 ( pi/4 * sum ( X(i) ) )\n' );

  return
end
