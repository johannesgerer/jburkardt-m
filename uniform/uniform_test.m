function uniform_test ( )

%*****************************************************************************80
%
%% UNIFORM_TEST tests the UNIFORM library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 December 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the UNIFORM library.\n' );

  bvec_uniform_test ( );

  c4_uniform_01_test ( );
  c4mat_uniform_01_test ( );
  c4vec_uniform_01_test ( );

  c8_uniform_01_test ( );
  c8mat_uniform_01_test ( );
  c8vec_uniform_01_test ( );

  ch_uniform_ab_test ( );

  get_seed_test ( );

  i4_seed_advance_test ( );

  i4_uniform_0i_test ( );
  i4_uniform_ab_test ( );
  i4mat_uniform_ab_test ( );
  i4vec_uniform_ab_test ( );

  l4_uniform_test ( );
  l4mat_uniform_test ( );
  l4vec_uniform_test ( );

  lcrg_anbn_test ( );
  lcrg_seed_test ( );

  r4_uniform_01_test ( );
  r4_uniform_ab_test ( );
  r4mat_uniform_ab_test ( );
  r4vec_uniform_ab_test ( );

  r8_uniform_01_test ( );
  r8_uniform_ab_test ( );
  r8mat_uniform_ab_test ( );
  r8vec_uniform_01_test ( );
  r8vec_uniform_ab_test ( );

  r8col_uniform_abvec_test ( );
  r8row_uniform_abvec_test ( );
  r8vec_uniform_abvec_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
