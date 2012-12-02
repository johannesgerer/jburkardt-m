function p32_title ( )

%*****************************************************************************80
%
%% P32_TITLE prints a title for problem 32.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
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
  fprintf ( 1, 'Problem 32\n' );
  fprintf ( 1, '  Name:       Genz #6, Discontinuous\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, ...
    '  Integrand:  F(X) = exp ( C(i) * X(i) ) if X <= Z, 0 otherwise.\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 1/DIM_NUM.\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to 0.5.\n' );

  return
end
