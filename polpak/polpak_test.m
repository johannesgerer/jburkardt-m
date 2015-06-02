function polpak_test ( )

%*****************************************************************************80
%
%% POLPAK_TEST tests the POLPAK library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLPAK_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the POLPAK library.\n' );

  agud_test ( );
  align_enum_test ( );
  bell_test ( );
  benford_test ( );
  bernoulli_number_test ( );
  bernoulli_number2_test ( );
  bernoulli_number3_test ( );
  bernoulli_poly_test ( );
  bernoulli_poly2_test ( );
  bernstein_poly_test ( );
  bpab_test ( );
  cardan_poly_test ( );
  cardan_poly_coef_test ( );
  cardinal_cos_test ( );
  cardinal_sin_test ( );
  catalan_test ( );
  catalan_row_next_test ( );
  charlier_test ( );
  cheby_t_poly_test ( );
  cheby_t_poly_coef_test ( );
  cheby_t_poly_zero_test ( );
  cheby_u_poly_test ( );
  cheby_u_poly_coef_test ( );
  cheby_u_poly_zero_test ( );
  chebyshev_discrete_test ( );
  collatz_count_test ( );
  collatz_count_max_test ( );
  comb_row_next_test ( );
  commul_test ( );
  complete_symmetric_poly_test ( );
  cos_power_int_test ( );
  delannoy_test ( );
  euler_number_test ( );
  euler_number2_test ( );
  euler_poly_test ( );
  eulerian_test ( );
  f_hofstadter_test ( );
  fibonacci_direct_test ( );
  fibonacci_floor_test ( );
  fibonacci_recursive_test ( );
  g_hofstadter_test ( );
  gegenbauer_poly_test ( );
  gen_hermite_poly_test ( );
  gen_laguerre_poly_test ( );
  gud_test ( );
  hail_test ( );
  h_hofstadter_test ( );
  hermite_poly_phys_test ( );
  hermite_poly_phys_coef_test ( );
  i4_choose_test ( );
  i4_factor_test ( );
  i4_factorial_test ( );
  i4_factorial2_test ( );
  i4_is_prime_test ( );
  i4_is_triangular_test ( );
  i4_partition_distinct_count_test ( );
  i4_to_triangle_test ( );
  i4_uniform_ab_test ( );
  jacobi_poly_test ( );
  jacobi_symbol_test ( );
  krawtchouk_test ( );
  laguerre_associated_test ( );
  laguerre_poly_test ( );
  laguerre_poly_coef_test ( );
  legendre_poly_test ( );
  legendre_poly_coef_test ( );
  legendre_associated_test ( );
  legendre_associated_normalized_test ( );
  legendre_function_q_test ( );
  legendre_symbol_test ( );
  lerch_test ( );
  lock_test ( );
  meixner_test( );
  mertens_test ( );
  moebius_test ( );
  motzkin_test ( );
  normal_01_cdf_inverse_test ( );
  omega_test ( );
  pentagon_num_test ( );
  phi_test ( );
  plane_partition_num_test ( );
  poly_bernoulli_test ( );
  poly_coef_count_test ( );
  prime_test ( );
  pyramid_num_test ( );
  pyramid_square_num_test ( );
  r8_agm_test ( );
  r8_beta_test ( );
  r8_choose_test ( );
  r8_erf_test ( );
  r8_erf_inverse_test ( );
  r8_euler_constant_test ( );
  r8_factorial_test ( );
  r8_factorial_log_test ( );
  r8_huge_test ( );
  r8_hyper_2f1_test ( );
  r8_mop_test ( );
  r8_nint_test ( );
  r8_pi_test ( );
  r8_psi_test ( );
  r8_uniform_01_test ( );
  r8poly_degree_test ( );
  r8poly_print_test ( );
  r8poly_value_horner_test ( );
  r8vec_linspace_test ( );
  sigma_test ( );
  simplex_num_test ( );
  sin_power_int_test ( );
  slice_test ( );
  spherical_harmonic_test ( );
  stirling1_test ( );
  stirling2_test ( );
  tau_test ( );
  tetrahedron_num_test ( );
  triangle_num_test ( );
  triangle_to_i4_test ( );
  trinomial_test ( );
  v_hofstadter_test ( );
  vibonacci_test ( );
  zeckendorf_test ( );
  zernike_poly_test ( );
  zernike_poly_coef_test ( );
  zeta_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLPAK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
