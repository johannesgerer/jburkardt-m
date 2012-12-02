function p26_title ( )

%*****************************************************************************80
%
%% P26_TITLE prints a title for problem 26.
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
  fprintf ( 1, 'Problem 26\n' );
  fprintf ( 1, '  Name:       Patterson #1\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, ...
    '  Integrand:  F(X) = product ( C(i) * exp ( - C(i) * X(i) ) )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 1/DIM_NUM.\n' );

  return
end
