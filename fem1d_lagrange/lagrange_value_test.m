function lagrange_value_test ( )

%*****************************************************************************80
%
%% LAGRANGE_VALUE_TEST tests LAGRANGE_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_VALUE_TEST\n' );
  fprintf ( 1, '  LAGRANGE_VALUE evaluates the Lagrange basis polynomials.\n' );

  nd = 5;
  xlo = 0.0;
  xhi = nd - 1; 
  xd = linspace ( xlo, xhi, nd );

  r8vec_print ( nd, xd, '  Lagrange basis points:' );
%
%  Evaluate the polynomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I      X          L1(X)       L2(X)       L3(X)       L4(X)' );
  fprintf ( 1, '       L5(X)\n' );
  fprintf ( 1, '\n' );
 
  ni = 2 * nd - 1;
  xi = linspace ( xlo, xhi, ni );
  li = lagrange_value ( nd, xd, ni, xi );

  for i = 1 : ni
 
    fprintf ( 1, '  %2d  %10f', i, xi(i) );
    for j = 1 : nd
      fprintf ( 1, '  %10f', li(i,j) );
    end
    fprintf ( 1, '\n' );
 
  end

  return
end
