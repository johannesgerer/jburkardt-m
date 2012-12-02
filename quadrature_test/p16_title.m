function p16_title ( )

%*****************************************************************************80
%
%% P16_TITLE prints a title for problem 16.
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
  fprintf ( 1, 'Problem 16\n' );
  fprintf ( 1, '  Name:       L1(X-Z)\n' );
  fprintf ( 1, '              Lipschitz continuous.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = sum ( | X(i) - Z(i) | )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to (0.5,0.5,...)\n' );

  return
end
