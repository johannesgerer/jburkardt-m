function lp_coefficients_test ( )

%*****************************************************************************80
%
%% LP_COEFFICIENTS_TEST tests LP_COEFFICIENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2014
%
%  Author:
%
%    John Burkardt
%
  n_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LP_COEFFICIENTS_TEST\n' );
  fprintf ( 1, ...
    '  LP_COEFFICIENTS: coefficients of Legendre polynomial P(n,x).\n' );
  fprintf ( 1, '\n' );
  
  for n = 0 : n_max

    [ o, c, f ] = lp_coefficients ( n );

    m = 1;
    e(1:o) = f(1:o) + 1;

    label = sprintf ( '  P(%d,x) = ', n );
    polynomial_print ( m, o, c, e, label );

   end

  return
end