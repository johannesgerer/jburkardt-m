function p27_title ( )

%*****************************************************************************80
%
%% P27_TITLE prints a title for problem 27.
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
  fprintf ( 1, 'Problem 27\n' );
  fprintf ( 1, '  Name:       Genz #1 / Patterson #5, Oscillatory\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, ...
    '  Integrand:  F(X) = cos ( 2 * pi * R + sum ( C(i) * X(i) ) )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              R, defaults to 0.3\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 1/DIM_NUM\n' );

  return
end
