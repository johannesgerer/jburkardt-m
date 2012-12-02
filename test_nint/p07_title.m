function p07_title ( )

%*****************************************************************************80
%
%% P07_TITLE prints a title for problem 07.
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
  fprintf ( 1, 'Problem 07\n' );
  fprintf ( 1, '  Name:       DR4062\n' );
  fprintf ( 1, '              Davis, Rabinowitz, page 406, #2.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = prod ( pi * sin ( pi * X(i) ) / 2 )\n' );

  return
end
