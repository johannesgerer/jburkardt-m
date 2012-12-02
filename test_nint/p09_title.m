function p09_title ( )

%*****************************************************************************80
%
%% P09_TITLE prints a title for problem 09.
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
  fprintf ( 1, 'Problem 09\n' );
  fprintf ( 1, '  Name:       Patterson #7\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = exp ( sum ( C(i) * X(i) ) )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 1/DIM_NUM.\n' );

  return
end
