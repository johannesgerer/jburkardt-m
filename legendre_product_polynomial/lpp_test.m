function lpp_test ( )

%*****************************************************************************80
%
%% LPP_TEST tests the LEGENDRE_PRODUCT_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LPP_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LEGENDRE_PRODUCT_POLYNOMIAL library.\n' );

  i4_choose_test ( );
  i4_uniform_ab_test ( );

  i4vec_print_test ( );
  i4vec_uniform_ab_test ( );

  r8vec_print_test ( );
  r8vec_uniform_ab_test ( );

  comp_enum_test ( );
  comp_next_grlex_test ( );
  comp_random_grlex_test ( );
  comp_rank_grlex_test ( );
  comp_unrank_grlex_test ( );

  mono_next_grlex_test ( );
  mono_print_test ( );
  mono_rank_grlex_test ( );
  mono_unrank_grlex_test ( );
  mono_upto_enum_test ( );
  mono_upto_next_grlex_test ( );
  mono_upto_random_test ( );
  mono_value_test ( );

  polynomial_compress_test ( );
  polynomial_print_test ( );
  polynomial_sort_test ( );
  polynomial_value_test ( );

  lp_coefficients_test ( );
  lp_value_test ( );
  lp_values_test ( );

  lpp_to_polynomial_test ( );
  lpp_value_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LPP_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
