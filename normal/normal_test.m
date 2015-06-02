function normal_test ( )

%*****************************************************************************80
%
%% NORMAL_TEST tests the NORMAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 March 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the NORMAL library.\n' );

  c4_normal_01_test ( );
  c8_normal_01_test ( );
  i4_normal_ab_test ( );
  r4_normal_01_test ( );
  r4_normal_ab_test ( );
  r4_uniform_01_test ( );
  r8_normal_01_test ( );
  r8_normal_ab_test ( );
  r8_uniform_01_test ( );
  r8mat_normal_01_test ( );
  r8mat_normal_ab_test ( );
  r8vec_normal_01_test ( );
  r8vec_normal_ab_test ( );
  r8vec_uniform_01_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
