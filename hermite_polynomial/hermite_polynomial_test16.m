function hermite_polynomial_test16 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST16 tests Hermite projection.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST16:\n' );
  fprintf ( 1, '  As a sanity check, make sure that the projection of\n' );
  fprintf ( 1, '  He(i,x) is 1 for the i-th component and zero for all others.\n' );

  n = 3;

  [ x, w ] = he_quadrature_rule ( n + 1 );

  phi = hen_polynomial_value ( n + 1, n, x );

  for j = 0 : n

    c = zeros ( n + 1, 1 );

    f_vec(1:n+1,1) = phi ( 1 : n + 1, j + 1 );

    for i = 1 : n + 1
      phiw(i,1:n+1) = phi(i,1:n+1) * w(i);
    end

    c = phiw' * f_vec;
    title = sprintf ( '  Coefficients for He(%d,x)', j );

    r8vec_print ( n + 1, c, title );

  end

  return
end
