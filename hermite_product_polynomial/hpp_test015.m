function hpp_test015 ( )

%*****************************************************************************80
%
%% HPP_TEST015 tests HEP_COEFFICIENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
  m = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST015:\n' );
  fprintf ( 1, '  HEP_COEFFICIENTS computes the coefficients and\n' );
  fprintf ( 1, '  exponents of the Hermite polynomial He(n,x).\n' );

  for n = 1 : 5

    [ o, c, f ] = hep_coefficients ( n );

    l(1) = n;
    o_max = o;

    [ o, c, e ] = hepp_to_polynomial ( m, l, o_max );

    fprintf ( 1, '\n' );
    title = sprintf ( '  He(%d,x) = ', n );

    polynomial_print ( m, o, c, e, title );

  end

  return
end
