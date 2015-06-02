function i4lib_test ( )

%*****************************************************************************80
%
%% I4LIB_TEST tests the I4LIB library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the I4LIB library.\n' );

  i4_abs_test ( );
  i4_bit_hi1_test ( );
  i4_bit_lo0_test ( );
  i4_bit_lo1_test ( );
  i4_bit_reverse_test ( );
  i4_ceiling_test ( );
  i4_characteristic_test ( );
  i4_choose_test ( );
  i4_div_rounded_test ( );
  i4_divp_test ( );
  i4_factorial2_test ( );
  i4_fall_test ( );
  i4_floor_test ( );
  i4_gcd_test ( );
  i4_huge_test ( );
  i4_huge_normalizer_test ( );
  i4_is_even_test ( );
  i4_is_odd_test ( );
  i4_is_prime_test ( );
  i4_lcm_test ( );
  i4_log_10_test ( );
  i4_log_2_test ( );
  i4_log_i4_test ( );
  i4_log_r8_test ( );
  i4_mant_test ( );
  i4_max_test ( );
  i4_min_test ( );
  i4_moddiv_test ( );
  i4_modp_test ( );
  i4_rise_test ( );
  i4_sign_test ( );
  i4_sign3_test ( );
  i4_swap_test ( );
  i4_to_halton_test ( );
  i4_to_pascal_test ( );
  i4_to_pascal_degree_test ( );
  i4_to_triangle_test ( );
  i4_uniform_ab_test ( );
  i4_walsh_1d_test ( );
  i4_wrap_test ( );
  i4_xor_test ( );

  i4block_print_test ( );

  i4col_find_item_test ( );
  i4col_find_pair_wrap_test ( );
  i4col_sort_a_test ( );
  i4col_sort_d_test ( );
  i4col_sort2_a_test ( );
  i4col_sorted_singleton_count_test ( );
  i4col_sorted_unique_count_test ( );

  i4mat_elim_test ( );
  i4mat_indicator_test ( );
  i4mat_l1_inverse_test ( );
  i4mat_max_test ( );
  i4mat_max_index_test ( );
  i4mat_min_test ( );
  i4mat_min_index_test ( );
  i4mat_perm_uniform_test ( );
  i4mat_red_test ( );
  i4mat_u1_inverse_test ( );

  i4row_max_test ( );
  i4row_mean_test ( );
  i4row_min_test ( );
  i4row_sort_a_test ( );
  i4row_sort_d_test ( );
  i4row_sort2_d_test ( );
  i4row_sum_test ( );
  i4row_swap_test ( );
  i4row_variance_test ( );

  i4vec_add_test ( );
  i4vec_amax_test ( );
  i4vec_amax_index_test ( );
  i4vec_amin_test ( );
  i4vec_amin_index_test ( );
  i4vec_aminz_test ( );
  i4vec_aminz_index_test ( );
  i4vec_ascend_sub_test ( );
  i4vec_ascends_test ( );
  i4vec_bracket_test ( );
  i4vec_concatenate_test ( );
  i4vec_cum_test ( );
  i4vec_cum0_test ( );
  i4vec_decrement_test ( );
  i4vec_descends_test ( );
  i4vec_direct_product_test ( );
  i4vec_direct_product2_test ( );
  i4vec_frac_test ( );
  i4vec_heap_a_test ( );
  i4vec_heap_d_test ( );
  i4vec_heap_d_extract_test ( );
  i4vec_heap_d_insert_test ( );
  i4vec_heap_d_max_test ( );
  i4vec_histogram_test ( );
  i4vec_increment_test ( );
  i4vec_index_test ( );
  i4vec_index_delete_all_test ( );
  i4vec_index_delete_dupes_test ( );
  i4vec_index_delete_one_test ( );
  i4vec_index_insert_test ( );
  i4vec_index_insert_unique_test ( );
  i4vec_index_order_test ( );
  i4vec_index_search_test ( );
  i4vec_indexed_heap_d_test ( );
  i4vec_indexed_heap_d_extract_test ( );
  i4vec_indexed_heap_d_insert_test ( );
  i4vec_indexed_heap_d_max_test ( );
  i4vec_indicator0_test ( );
  i4vec_indicator1_test ( );
  i4vec_insert_test ( );
  i4vec_max_test ( );
  i4vec_max_index_test ( );
  i4vec_max_index_last_test ( );
  i4vec_mean_test ( );
  i4vec_median_test ( );
  i4vec_merge_a_test ( );
  i4vec_min_test ( );
  i4vec_min_index_test ( );
  i4vec_nonzero_count_test ( );
  i4vec_nonzero_first_test ( );
  i4vec_order_type_test ( );
  i4vec_pairwise_prime_test ( );
  i4vec_part_test ( );
  i4vec_part_quick_a_test ( );
  i4vec_permute_test ( );
  i4vec_permute_uniform_test ( );
  i4vec_reverse_test ( );
  i4vec_run_count_test ( );
  i4vec_search_binary_a_test ( );
  i4vec_sort_bubble_a_test ( );
  i4vec_sort_heap_a_test ( );
  i4vec_sort_heap_d_test ( );
  i4vec_sort_heap_index_a_test ( );
  i4vec_sort_heap_index_d_test ( );
  i4vec_sort_insert_a_test ( );
  i4vec_sort_quick_a_test ( );
  i4vec_sort_shell_a_test ( );
  i4vec_sorted_undex_test ( );
  i4vec_sorted_unique_test ( );
  i4vec_sorted_unique_hist_test ( );
  i4vec_sum_test ( );
  i4vec_transpose_print_test ( );
  i4vec_undex_test ( );
  i4vec_uniform_ab_test ( );
  i4vec_unique_index_test ( );
  i4vec_value_index_test ( );
  i4vec_variance_test ( );

  i4vec2_sort_a_test ( );
  i4vec2_sort_d_test ( );
  i4vec2_sorted_unique_test ( );

  pascal_to_i4_test ( );

  perm0_check_test ( );
  perm0_uniform_test ( );

  perm1_check_test ( );
  perm1_uniform_test ( );

  prime_test ( );

  triangle_to_i4_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
