function msm_to_mm_test ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST runs the MSM_TO_MM tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
%
%  Author:
%
%   John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_MM_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MSM_TO_MM library.\n' );

  msm_to_mm_test01 ( );
  msm_to_mm_test02 ( );
  msm_to_mm_test03 ( );
  msm_to_mm_test04 ( );

  msm_to_mm_test05 ( );
  msm_to_mm_test06 ( );
  msm_to_mm_test07 ( );

  msm_to_mm_test08 ( );
  msm_to_mm_test09 ( );
  msm_to_mm_test10 ( );

  msm_to_mm_test11 ( );
  msm_to_mm_test12 ( );
  msm_to_mm_test13 ( );
  msm_to_mm_test14 ( );

  msm_to_mm_test15 ( );
  msm_to_mm_test16 ( );
  msm_to_mm_test17 ( );

  msm_to_mm_test18 ( );
  msm_to_mm_test19 ( );
  msm_to_mm_test20 ( );

  msm_to_mm_test21 ( );
  msm_to_mm_test22 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_MM_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
