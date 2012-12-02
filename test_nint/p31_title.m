function p31_title ( )

%*****************************************************************************80
%
%% P31_TITLE prints a title for problem 31.
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
  fprintf ( 1, 'Problem 31\n' );
  fprintf ( 1, '  Name:       Genz #5, C0 Pseudo-Gaussian\n' );
  fprintf ( 1, '              Nondifferentiable peak at point Z.\n' );
  fprintf ( 1, '  Region:     0 <= X(i) <= 1\n' );
  fprintf ( 1, '  Integrand:  F(X) = exp ( -sum ( C(i) * | X(i) - Z(i) | ))\n' );
  fprintf ( 1, '  Parameters:\n' );
  fprintf ( 1, '              C(1:DIM_NUM) defaults to 2.0;\n' );
  fprintf ( 1, '              Z(1:DIM_NUM) defaults to 0.5;\n' );

  return
end
