function triangle_integrals_test ( )

%*****************************************************************************80
%
%% TRIANGLE_INTEGRALS_TEST tests the TRIANGLE_INTEGRALS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_INTEGRALS_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TRIANGLE_INTEGRALS library.\n' );

  i4_to_pascal_test ( );
  i4_to_pascal_degree_test ( );
  pascal_to_i4_test ( );
  r8mat_print_test ( );
  r8mat_print_some_test ( );
  trinomial_test ( );

  rs_to_xy_map_test ( );
  xy_to_rs_map_test ( );

  poly_print_test ( );
  poly_power_linear_test ( );
  poly_power_test ( );
  poly_product_test ( );

  triangle01_monomial_integral_test ( );
  triangle01_poly_integral_test ( );
  triangle_area_test ( );
  triangle_xy_integral_test ( );
  triangle_monomial_integral_test ( );
  triangle_poly_integral_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_INTEGRALS_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
