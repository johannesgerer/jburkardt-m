function truncated_normal_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_TEST tests the TRUNCATED_NORMAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRUNCATED_NORMAL library.\n' );
%
%  Utilities.
%
  i4_uniform_ab_test ( );
  r8_choose_test ( );
  r8_factorial2_test ( );
  r8_mop_test ( );
  r8_uniform_01_test ( );
  r8poly_print_test ( );
  r8poly_value_horner_test ( ); 
  r8vec_linspace_test ( );
  r8vec_print_test ( );
%
%  Library.
%
  normal_01_cdf_test ( );
  normal_01_cdf_inv_test ( );
  normal_01_mean_test ( );
  normal_01_moment_test ( );
  normal_01_pdf_test ( );
  normal_01_sample_test ( );
  normal_01_variance_test ( );

  normal_ms_cdf_test ( );
  normal_ms_cdf_inv_test ( );
  normal_ms_mean_test ( );
  normal_ms_moment_test ( );
  normal_ms_moment_central_test ( );
  normal_ms_pdf_test ( );
  normal_ms_sample_test ( );
  normal_ms_variance_test ( );

  truncated_normal_a_cdf_test ( );
  truncated_normal_a_cdf_inv_test ( );
  truncated_normal_a_mean_test ( );
  truncated_normal_a_moment_test ( );
  truncated_normal_a_pdf_test ( );
  truncated_normal_a_sample_test ( );
  truncated_normal_a_variance_test ( );

  truncated_normal_ab_cdf_test ( );
  truncated_normal_ab_cdf_inv_test ( );
  truncated_normal_ab_mean_test ( );
  truncated_normal_ab_moment_test ( );
  truncated_normal_ab_pdf_test ( );
  truncated_normal_ab_sample_test ( );
  truncated_normal_ab_variance_test ( );

  truncated_normal_b_cdf_test ( );
  truncated_normal_b_cdf_inv_test ( );
  truncated_normal_b_mean_test ( );
  truncated_normal_b_moment_test ( );
  truncated_normal_b_pdf_test ( );
  truncated_normal_b_sample_test ( );
  truncated_normal_b_variance_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
