function c8lib_test ( )

%*****************************************************************************80
%
%% C8LIB_TEST tests the C8LIB library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 March 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8LIB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the C8LIB library.\n' );

  c8_abs_test ( );
  c8_acos_test ( );
  c8_acosh_test ( );
  c8_add_test ( );
  c8_arg_test ( );
  c8_asin_test ( );
  c8_asinh_test ( );
  c8_atan_test ( );
  c8_atanh_test ( );
  c8_conj_test ( );
  c8_cos_test ( );
  c8_cosh_test ( );
  c8_cube_root_test ( );
  c8_div_test ( );
  c8_div_r8_test ( );
  c8_exp_test ( );
  c8_i_test ( );
  c8_imag_test ( );
  c8_inv_test ( );
  c8_le_l1_test ( );
  c8_le_l2_test ( );
  c8_le_li_test ( );
  c8_log_test ( );
  c8_mag_test ( );
  c8_mul_test ( );
  c8_nint_test ( );
  c8_norm_l1_test ( );
  c8_norm_l2_test ( );
  c8_norm_li_test ( );
  c8_normal_01_test ( );
  c8_one_test ( );
  c8_print_test ( );
  c8_real_test ( );
  c8_sin_test ( );
  c8_sinh_test ( );
  c8_sqrt_test ( );
  c8_sub_test ( );
  c8_tan_test ( );
  c8_tanh_test ( );
  c8_to_cartesian_test ( );
  c8_to_polar_test ( );
  c8_uniform_01_test ( );
  c8_zero_test ( );

  c8mat_identity_test ( );
  c8mat_indicator_test ( );
  c8mat_norm_fro_test ( );
  c8mat_norm_l1_test ( );
  c8mat_norm_li_test ( );
  c8mat_uniform_01_test ( );

  c8vec_indicator_test ( );
  c8vec_nint_test ( );
  c8vec_norm_l1_test ( );
  c8vec_norm_l2_test ( );
  c8vec_norm_li_test ( );
  c8vec_print_test ( );
  c8vec_sort_a_l1_test ( );
  c8vec_sort_a_l2_test ( );
  c8vec_sort_a_li_test ( );
  c8vec_spiral_test ( );
  c8vec_uniform_01_test ( );
  c8vec_unity_test ( );

  cartesian_to_c8_test ( );

  polar_to_c8_test ( );

  r8_atan_test ( );
  r8_sign_test ( );
  r8_uniform_01_test ( );

  r8poly2_root_test ( );
  r8poly3_root_test ( );
  r8poly4_root_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8LIB_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
