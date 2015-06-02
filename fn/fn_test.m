function fn_test ( )

%*****************************************************************************80
%
%% FN_TEST tests the FN library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FN_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FN library.\n' );

  acos_test ( );
  acosh_test ( );
  ai_test ( );
  aid_test ( );
  asin_test ( );
  asinh_test ( );
  atan_test ( );
  atan2_test ( );
  atanh_test ( );
  besi0_test ( );
  besi1_test ( );
  besj0_test ( );
  besj1_test ( );
  besk_test ( );
  besk0_test ( );
  besk1_test ( );
  besy0_test ( );
  besy1_test ( );
  beta_test ( );
  betai_test ( );
  bi_test ( );
  bid_test ( );
  binom_test ( );
  cbrt_test ( );
  chi_test ( );
  chu_test ( );
  ci_test ( );
  cin_test ( );
  cinh_test ( );
  cos_test ( );
  cos_deg_test ( );
  cosh_test ( );
  cot_test ( );
  dawson_test ( );
  e1_test ( );
  ei_test ( );
  erf_test ( );
  erfc_test ( );
  exp_test ( );
  fac_test ( );
  gamma_test ( );
  gamma_inc_test ( );
  gamma_inc_tricomi_test ( );
  int_test ( );
  lbeta_test ( );
  li_test ( );
  lngam_test ( );
  log_test ( );
  log10_test ( );
  poch_test ( );
  psi_test ( );
  rand_test ( );
  shi_test ( );
  si_test ( );
  sin_test ( );
  sin_deg_test ( );
  sinh_test ( );
  spence_test ( );
  sqrt_test ( );
  tan_test ( );
  tanh_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FN_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
