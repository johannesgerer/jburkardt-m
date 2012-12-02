function p28_title ( )

%*****************************************************************************80
%
%% P28_TITLE prints a title for problem 28.
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
  fprintf ( 1, 'Problem 28\n' );
  fprintf ( 1, '  Name:       Genz #2 / Patterson #6, Product Peak\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, ...
    '  Integrand:  F(X) = 1 / product ( C(i)^2 + ( X(i) - Z(i) )^2 )\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to DIM_NUM^(9/4)/sqrt(170)\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to 0.5.\n' );

  return
end
