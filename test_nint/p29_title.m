function p29_title ( )

%*****************************************************************************80
%
%% P29_TITLE prints a title for problem 29.
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
  fprintf ( 1, 'Problem 29\n' );
  fprintf ( 1, '  Name:       Genz #3 / Patterson #8, Corner Peak\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = 1 / ( 1 + sum( C(i) * X(i) ) )^R\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              R, defaults to 0.3\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 1/DIM_NUM.\n' );

  return
end
