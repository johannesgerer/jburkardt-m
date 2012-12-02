function chebyshev_polynomial_test01 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST01 tests T_PROJECT_COEFFICIENTS_DATA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST01:\n' );
  fprintf ( 1, '  T_PROJECT_COEFFICIENTS_DATA estimates the Chebyshev polynomial\n' );
  fprintf ( 1, '  coefficients for a function given as data (x,fx).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we use fx = f(x) = x^2 for the data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Since T(0,x) = 1 and T(2,x) = 2*x^2 - 1, the correct expansion is\n' );
  fprintf ( 1, '  f(x) = 1/2 T(0,x) + 0 T(1,x) + 1/2 T(2,x) + 0 * all other polys.\n' );
%
%  Data in [0,1];
%
  a = 0.0;
  b = 1.0;
  m = 20;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( m, seed );
  d = x.^2;

  r8vec2_print ( m, x, d, '  Data ( X, D ):' );

  n = 4;
  c = t_project_coefficients_data ( a, b, m, n, x, d );
  
  r8vec_print ( n, c, '  Coefficients of Chebyshev expansion of degree 4.' );
%
%  Compare Chebyshev expansion and original function.
%
  d2 = t_project_value ( m, n, x, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I      X(I)     Data(I)      Chebyshev(X(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %2d  %12g  %12g  %12g\n', i, x(i), d(i), d2(i) );
  end

  return
end
