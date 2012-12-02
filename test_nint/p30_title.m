function p30_title ( )

%*****************************************************************************80
%
%% P30_TITLE prints a title for problem 30.
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
  fprintf ( 1, 'Problem 30\n' );
  fprintf ( 1, '  Name:       Genz #4 / Patterson #9, Gaussian\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, ...
    '  Integrand:  F(X) = exp ( - sum ( C(i)^2 * ( X(i) - Z(i) )^2 )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 1/DIM_NUM.\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to 0.5.\n' );

  return
end
