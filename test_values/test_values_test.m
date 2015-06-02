function test_values_test ( )

%*****************************************************************************80
%
%% TEST_VALUES_TEST tests the TEST_VALUES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_VALUES_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TEST_VALUES library.\n' );

  abram0_values_test ( );
  abram1_values_test ( );
  abram2_values_test ( );
  agm_values_test ( );
  airy_ai_values_test ( );
  airy_ai_int_values_test ( );
  airy_ai_prime_values_test ( );
  airy_bi_values_test ( );
  airy_bi_int_values_test ( );
  airy_bi_prime_values_test ( );
  airy_cai_values_test ( );
  airy_cbi_values_test ( );
  airy_gi_values_test ( );
  airy_hi_values_test ( );
  arccos_values_test ( );
  arccosh_values_test ( );
  arcsin_values_test ( );
  arcsinh_values_test ( );
  arctan_values_test ( );
  arctan_int_values_test ( );
  arctan2_values_test ( );
  arctanh_values_test ( );

  bei0_values_test ( );
  bei1_values_test ( );
  bell_values_test ( );
  ber0_values_test ( );
  ber1_values_test ( );
  bernoulli_number_values_test ( );
  bernoulli_poly_values_test ( );
  bernstein_poly_01_values_test ( );
  bessel_i0_values_test ( );
  bessel_i0_int_values_test ( );
  bessel_i0_spherical_values_test ( );
  bessel_i1_values_test ( );
  bessel_i1_spherical_values_test ( );
  bessel_in_values_test ( );
  bessel_ix_values_test ( );
  bessel_j0_values_test ( );
  bessel_j0_int_values_test ( );
  bessel_j0_spherical_values_test ( );
  bessel_j1_values_test ( );
  bessel_j1_spherical_values_test ( );
  bessel_jn_values_test ( );
  bessel_jx_values_test ( );
  bessel_k0_values_test ( );
  bessel_k0_int_values_test ( );
  bessel_k1_values_test ( );
  bessel_kn_values_test ( );
  bessel_kx_values_test ( );
  bessel_y0_values_test ( );
  bessel_y0_int_values_test ( );
  bessel_y0_spherical_values_test ( );
  bessel_y1_values_test ( );
  bessel_y1_spherical_values_test ( );
  bessel_yn_values_test ( );
  bessel_yx_values_test ( );
  beta_values_test ( );
  beta_cdf_values_test ( );
  beta_inc_values_test ( );
  beta_log_values_test ( );
  beta_noncentral_cdf_values_test ( );
  binomial_values_test ( );
  binomial_cdf_values_test ( );
  bivariate_normal_cdf_values_test ( );

  catalan_values_test ( );
  cauchy_cdf_values_test ( );
  cbrt_values_test ( );
  cheby_t_poly_values_test ( );
  cheby_u_poly_values_test ( );
  cheby_v_poly_values_test ( );
  cheby_w_poly_values_test ( );
  chi_values_test ( );
  chi_square_cdf_values_test ( );
  chi_square_noncentral_cdf_values_test ( );
  ci_values_test ( )
  cin_values_test ( );
  cinh_values_test ( );
  clausen_values_test ( );
  clebsch_gordan_values_test ( );
  collatz_count_values_test ( );
  cos_values_test ( );
  cos_degree_values_test ( );
  cos_power_int_values_test ( );
  cosh_values_test ( );
  cot_values_test ( );
  cp_values_test ( );

  dawson_values_test ( );
  debye1_values_test ( );
  debye2_values_test ( );
  debye3_values_test ( );
  debye4_values_test ( );
  dedekind_sum_values_test ( );
  dielectric_values_test ( );
  dilogarithm_values_test ( );

  e1_values_test ( );
  ei_values_test ( );
  elliptic_ea_values_test ( );
  elliptic_em_values_test ( );
  elliptic_ka_values_test ( );
  elliptic_km_values_test ( );
  erf_values_test ( );
  erfc_values_test ( );
  euler_number_values_test ( );
  euler_poly_values_test ( );
  exp_values_test ( );
  exp3_int_values_test ( );
  exponential_cdf_values_test ( );
  extreme_values_cdf_values_test ( );

  f_cdf_values_test ( );
  f_noncentral_cdf_values_test ( );
  fresnel_cos_values_test ( );
  fresnel_sin_values_test ( );
  frobenius_number_data_values_test ( );
  frobenius_number_order_values_test ( );
  frobenius_number_order2_values_test ( );

  gamma_values_test ( );
  gamma_cdf_values_test ( );
  gamma_inc_values_test ( );
  gamma_inc_p_values_test ( );
  gamma_inc_q_values_test ( );
  gamma_inc_tricomi_values_test ( );
  gamma_log_values_test ( );
  gegenbauer_poly_values_test ( );
  geometric_cdf_values_test ( );
  goodwin_values_test ( );
  gud_values_test ( );

  hermite_function_values_test ( );
  hermite_poly_phys_values_test ( );
  hermite_poly_prob_values_test ( );
  hyper_1f1_values_test ( );
  hyper_2f1_values_test ( );
  hypergeometric_cdf_values_test ( );
  hypergeometric_pdf_values_test ( );
  hypergeometric_u_values_test ( );

  i0ml0_values_test ( );
  i1ml1_values_test ( );
  i4_factorial_values_test ( );
  i4_factorial2_values_test ( );
  i4_fall_values_test ( );
  i4_rise_values_test ( );
  int_values_test ( );

  jacobi_cn_values_test ( );
  jacobi_dn_values_test ( );
  jacobi_poly_values_test ( );
  jacobi_sn_values_test ( );
  jed_ce_values_test ( );
  jed_mjd_values_test ( );
  jed_rd_values_test ( );
  jed_weekday_values_test ( );

  kei0_values_test ( );
  kei1_values_test ( );
  ker0_values_test ( );
  ker1_values_test ( );

  laguerre_associated_values_test ( );
  laguerre_general_values_test ( );
  laguerre_polynomial_values_test ( );
  lambert_w_values_test ( );
  laplace_cdf_values_test ( );
  legendre_associated_values_test ( );
  legendre_associated_normalized_values_test ( );
  legendre_associated_normalized_sphere_values_test ( );
  legendre_poly_values_test ( );
  legendre_function_q_values_test ( );
  lerch_values_test ( );
  lobachevsky_values_test ( );
  lobatto_polynomial_values_test ( );
  lobatto_polynomial_derivatives_test ( );
  log_values_test ( );
  log_normal_cdf_values_test ( );
  log_series_cdf_values_test ( );
  log10_values_test ( );
  logarithmic_integral_values_test ( );
  logistic_cdf_values_test ( );

  mertens_values_test ( );
  moebius_values_test ( );

  negative_binomial_cdf_values_test ( );
  nine_j_values_test ( );
  normal_cdf_values_test ( );
  normal_01_cdf_values_test ( );

  omega_values_test ( );
  owen_values_test ( );

  partition_count_values_test ( );
  partition_distinct_count_values_test ( );
  phi_values_test ( );
  pi_values_test ( );
  poisson_cdf_values_test ( );
  polylogarithm_values_test ( );
  prandtl_values_test ( );
  prime_values_test ( );
  psat_values_test ( );
  psi_values_test ( );

  r8_factorial_values_test ( );
  r8_factorial_log_values_test ( );
  r8_factorial2_values_test ( );
  r8_fall_values_test ( );
  r8_rise_values_test ( );
  rayleigh_cdf_values_test ( );

  secvir_values_test ( );
  shi_values_test ( );
  si_values_test ( );
  sigma_values_test ( );
  sin_values_test ( );
  sin_degree_values_test ( );
  sin_power_int_values_test ( );
  sinh_values_test ( );
  six_j_values_test ( );
  sound_values_test ( );
  sphere_unit_area_values_test ( );
  sphere_unit_volume_values_test ( );
  spherical_harmonic_values_test ( );
  sqrt_values_test ( );
  stirling1_values_test ( );
  stirling2_values_test ( );
  stromgen_values_test ( );
  struve_h0_values_test ( );
  struve_h1_values_test ( );
  struve_l0_values_test ( );
  struve_l1_values_test ( );
  student_cdf_values_test ( );
  student_noncentral_cdf_values_test ( );
  subfactorial_values_test ( );
  surten_values_test ( );
  synch1_values_test ( );
  synch2_values_test ( );

  tan_values_test ( );
  tanh_values_test ( );
  tau_values_test ( );
  thercon_values_test ( );
  three_j_values_test ( );
  tran02_values_test ( );
  tran03_values_test ( );
  tran04_values_test ( );
  tran05_values_test ( );
  tran06_values_test ( );
  tran07_values_test ( );
  tran08_values_test ( );
  tran09_values_test ( );
  trigamma_values_test ( );
  truncated_normal_ab_cdf_values_test ( );
  truncated_normal_ab_pdf_values_test ( );
  truncated_normal_a_cdf_values_test ( );
  truncated_normal_a_pdf_values_test ( );
  truncated_normal_b_cdf_values_test ( );
  truncated_normal_b_pdf_values_test ( );
  tsat_values_test ( );

  van_der_corput_values_test ( );
  viscosity_values_test ( );
  von_mises_cdf_values_test ( );

  weekday_values_test ( );
  weibull_cdf_values_test ( );

  zeta_values_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_VALUES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
