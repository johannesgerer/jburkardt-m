function r8lib_test ( )

%*****************************************************************************80
%
%% R8LIB_TEST tests the R8LIB library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the R8LIB library.\n' );

  i4int_to_r8int_test ( );

  perm0_check_test ( );
  perm0_uniform_test ( );

  perm1_check_test ( );
  perm1_uniform_test ( );

  r8_abs_test ( );
  r8_acos_test ( );
  r8_acosh_test ( );
  r8_asinh_test ( );
  r8_atan_test ( );
  r8_atanh_test ( );
  r8_big_test ( );
  r8_cas_test ( );
  r8_ceiling_test ( );
  r8_choose_test ( );
  r8_cosd_test ( );
  r8_cotd_test ( );
  r8_cscd_test ( );
  r8_cube_root_test ( );
  r8_diff_test ( );
  r8_digit_test ( );
  r8_e_test ( );
  r8_epsilon_test ( );
  r8_epsilon_compute_test ( );
  r8_factorial_test ( );
  r8_factorial2_test ( );
  r8_fall_test ( );
  r8_fractional_test ( );
  r8_gamma_test ( );
  r8_gamma_log_test ( );
  r8_huge_test ( );
  r8_log_2_test ( );
  r8_log_b_test ( );
  r8_mant_test ( );
  r8_max_test ( );
  r8_min_test ( );
  r8_mod_test ( );
  r8_modp_test ( );
  r8_mop_test ( );
  r8_nint_test ( );
  r8_normal_01_test ( );
  r8_pi_test ( );
  r8_power_test ( );
  r8_power_fast_test ( );
  r8_rise_test ( );
  r8_round2_test ( );
  r8_roundb_test ( );
  r8_roundx_test ( );
  r8_secd_test ( );
  r8_sign_test ( );
  r8_sign3_test ( );
  r8_sind_test ( );
  r8_swap_test ( );
  r8_swap3_test ( );
  r8_tand_test ( );
  r8_to_r8_discrete_test ( );
  r8_to_i4_test ( );
  r8_uniform_ab_test ( );
  r8_uniform_01_test ( );
  r8_walsh_1d_test ( );
  r8_wrap_test ( );

  r82col_print_part_test ( );

  r82poly2_type_test ( );

  r82row_order_type_test ( );
  r82row_part_quick_a_test ( );
  r82row_print_part_test ( );
  r82row_sort_heap_index_a_test ( );
  r82row_sort_quick_a_test ( );

  r83col_print_part_test ( );

  r83row_print_part_test ( );

  r8block_expand_linear_test ( );
  r8block_print_test ( );

  r8col_find_test ( );
  r8col_insert_test ( );
  r8col_max_test ( );
  r8col_mean_test ( );
  r8col_min_test ( );
  r8col_permute_test ( );
  r8col_sort_heap_a_test ( );
  r8col_sort_heap_index_a_test ( );
  r8col_sort_quick_a_test ( );
  r8col_sorted_tol_unique_test ( );
  r8col_sorted_tol_unique_count_test ( );
  r8col_sorted_tol_undex_test ( );
  r8col_sortr_a_test ( );
  r8col_sum_test ( );
  r8col_swap_test ( );
  r8col_to_r8vec_test ( );
  r8col_tol_undex_test ( );
  r8col_undex_test ( );
  r8col_unique_count_test ( );
  r8col_variance_test ( );

  r8int_to_i4int_test ( );

  r8r8vec_index_insert_unique_test ( );

  r8r8r8vec_index_insert_unique_test ( );

  r8mat_cholesky_inverse_test ( );
  r8mat_cholesky_solve_test ( );
  r8mat_cholesky_solve_upper_test ( );
  r8mat_det_2d_test ( );
  r8mat_det_3d_test ( );
  r8mat_det_4d_test ( );
  r8mat_det_5d_test ( );
  r8mat_expand_linear_test ( );
  r8mat_expand_linear2_test ( );
  r8mat_fs_test ( );
  r8mat_fss_test ( );
  r8mat_givens_post_test ( );
  r8mat_givens_pre_test ( );
  r8mat_hess_test ( );
  r8mat_house_axh_test ( );
  r8mat_house_form_test ( );
  r8mat_house_post_test ( );
  r8mat_house_pre_test ( );
  r8mat_indicator_test ( );
  r8mat_inverse_2d_test ( );
  r8mat_inverse_3d_test ( );
  r8mat_inverse_4d_test ( );
  r8mat_jac_test ( );
  r8mat_kronecker_test ( );
  r8mat_l_inverse_test ( );
  r8mat_l_print_test ( );
  r8mat_l1_inverse_test ( );
  r8mat_lu_test ( );
  r8mat_max_test ( );
  r8mat_max_index_test ( );
  r8mat_min_test ( );
  r8mat_min_index_test ( );
  r8mat_maxcol_minrow_test ( );
  r8mat_maxrow_mincol_test ( );
  r8mat_mincol_maxrow_test ( );
  r8mat_minrow_maxcol_test ( );
  r8mat_mm_test ( );
  r8mat_mv_test ( );
  r8mat_nint_test ( );
  r8mat_nonzeros_test ( );
  r8mat_norm_fro_test ( );
  r8mat_norm_l1_test ( );
  r8mat_nullspace_test ( );
  r8mat_nullspace_size_test ( );
  r8mat_orth_uniform_test ( );
  r8mat_plot_test ( );
  r8mat_power_method_test ( );
  r8mat_print_test ( );
  r8mat_print_some_test ( );
  r8mat_ref_test ( );
  r8mat_rref_test ( );
  r8mat_solve_test ( );
  r8mat_solve_2d_test ( );
  r8mat_solve_3d_test ( );
  r8mat_solve2_test ( );
  r8mat_sub_test ( );
  r8mat_symm_jacobi_test ( );
  r8mat_to_r8plu_test ( );
  r8mat_trace_test ( );
  r8mat_transpose_print_test ( );
  r8mat_transpose_print_test ( );
  r8mat_u_inverse_test ( );
  r8mat_u1_inverse_test ( );
  r8mat_uniform_ab_test ( );

  r8plu_det_test ( );
  r8plu_inverse_test ( );
  r8plu_mul_test ( );
  r8plu_sol_test ( );
  r8plu_to_r8mat_test ( );

  r8poly_degree_test ( );
  r8poly_deriv_test ( );
  r8poly_lagrange_coef_test ( );
  r8poly_lagrange_0_test ( );
  r8poly_lagrange_1_test ( );
  r8poly_lagrange_2_test ( );
  r8poly_lagrange_factor_test ( );
  r8poly_lagrange_val_test ( );
  r8poly_print_test ( );
  r8poly_value_horner_test ( );
  r8poly_values_horner_test ( );

  r8poly2_ex_test ( );
  r8poly2_ex2_test ( );
  r8poly2_val_test ( );
  r8poly2_val2_test ( );
  r8poly2_root_test ( );

  r8poly3_root_test ( );

  r8poly4_root_test ( );

  r8row_max_test ( );
  r8row_mean_test ( );
  r8row_min_test ( );
  r8row_sum_test ( );
  r8row_swap_test ( );
  r8row_to_r8vec_test ( );
  r8row_variance_test ( );

  r8slmat_print_test ( );

  r8vec_amax_test ( );
  r8vec_amin_test ( );
  r8vec_bracket_test ( );
  r8vec_bracket2_test ( );
  r8vec_bracket3_test ( );
  r8vec_bracket5_test ( );
  r8vec_chebyspace_test ( );
  r8vec_concatenate_test ( );
  r8vec_convolution_test ( );
  r8vec_convolution_circ_test ( );
  r8vec_dif_test ( );
  r8vec_direct_product_test ( );
  r8vec_direct_product2_test ( );
  r8vec_even_test ( );
  r8vec_even2_test ( );
  r8vec_even3_test ( );
  r8vec_expand_linear_test ( );
  r8vec_frac_test ( );
  r8vec_histogram_test ( );
  r8vec_house_column_test ( );
  r8vec_index_delete_all_test ( );
  r8vec_index_delete_dupes_test ( );
  r8vec_index_delete_one_test ( );
  r8vec_index_insert_test ( );
  r8vec_index_insert_unique_test ( );
  r8vec_index_order_test ( );
  r8vec_index_search_test ( );
  r8vec_index_sorted_range_test ( );
  r8vec_indexed_heap_d_test ( );
  r8vec_indexed_heap_d_extract_test ( );
  r8vec_indexed_heap_d_insert_test ( );
  r8vec_indexed_heap_d_max_test ( );
  r8vec_indicator0_test ( );
  r8vec_indicator1_test ( );
  r8vec_legendre_test ( );
  r8vec_linspace_test ( );
  r8vec_max_test ( );
  r8vec_max_index_test ( );
  r8vec_mean_test ( );
  r8vec_median_test ( );
  r8vec_midspace_test ( );
  r8vec_min_test ( );
  r8vec_min_index_test ( );
  r8vec_nint_test ( );
  r8vec_norm_l0_test ( );
  r8vec_norm_l1_test ( );
  r8vec_norm_l2_test ( );
  r8vec_norm_li_test ( );
  r8vec_normal_01_test ( );
  r8vec_normalize_l1_test ( );
  r8vec_order_type_test ( );
  r8vec_permute_test ( );
  r8vec_permute_uniform_test ( );
  r8vec_polarize_test ( );
  r8vec_print_test ( );
  r8vec_rotate_test ( );
  r8vec_reverse_test ( );
  r8vec_search_binary_a_test ( );
  r8vec_sort_bubble_a_test ( );
  r8vec_sort_heap_a_test ( );
  r8vec_sort_heap_d_test ( );
  r8vec_sort_heap_index_a_test ( );
  r8vec_sort_heap_index_d_test ( );
  r8vec_sort_heap_mask_a_test ( );
  r8vec_sort_insert_a_test ( );
  r8vec_sort_insert_index_a_test ( );
  r8vec_sort_quick_a_test ( );
  r8vec_sorted_merge_a_test ( );
  r8vec_sorted_nearest_test ( );
  r8vec_sorted_range_test ( );
  r8vec_sorted_split_test ( );
  r8vec_sorted_undex_test ( );
  r8vec_sorted_unique_test ( );
  r8vec_sorted_unique_count_test ( );
  r8vec_sorted_unique_hist_test ( );
  r8vec_split_test ( );
  r8vec_transpose_print_test ( );
  r8vec_undex_test ( );
  r8vec_uniform_01_test ( );
  r8vec_uniform_ab_test ( );
  r8vec_variance_test ( );

  r8vec2_sort_a_test ( );
  r8vec2_sort_d_test ( );
  r8vec2_sort_heap_index_a_test ( );
  r8vec2_sorted_unique_test ( );
  r8vec2_sorted_unique_index_test ( );
  r8vec2_sum_max_index_test ( );

  roots_to_r8poly_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
