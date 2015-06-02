function bvec_test ( )

%*****************************************************************************80
%
%% BVEC_TEST tests the BVEC library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BVEC library.\n' );

  bvec_add_test ( );
  bvec_complement2_test ( );
  bvec_mul_test ( );
  bvec_next_test ( );
  bvec_next_grlex_test ( );
  bvec_print_test ( );
  bvec_sub_test ( );
  bvec_to_i4_test ( );
  bvec_uniform_test ( );
  i4_bclr_test ( );
  i4_bset_test ( );
  i4_btest_test ( );
  i4_to_bvec_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
