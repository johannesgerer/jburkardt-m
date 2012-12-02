function chebyshev_polynomial_test06 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST06 tests the projection of T(i,x) and T(j,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST06:\n' );
  fprintf ( 1, '  As a sanity check, make sure that the projection of:\n' );
  fprintf ( 1, '  T(i,x) onto T(j,x) is:\n' );
  fprintf ( 1, '  0 if i is not equal to j;\n' )
  fprintf ( 1, '  pi if i = j = 0;\n' );
  fprintf ( 1, '  pi/2 if i = j =/= 0.\n' );

  n = 3;

  [ x, w ] = t_quadrature_rule ( n + 1 );

  phi = t_polynomial ( n + 1, n, x );

  for j = 0 : n

    c = zeros ( n + 1, 1 );

    f_vec(1:n+1,1) = phi ( 1 : n + 1, j + 1 );

    for i = 1 : n + 1
      phiw(i,1:n+1) = phi(i,1:n+1) * w(i);
    end

    c = phiw' * f_vec;
    title = sprintf ( '  Chebyshev expansion coefficients for T(%d,x)', j );

    r8vec_print ( n + 1, c, title );

  end

  return
end
