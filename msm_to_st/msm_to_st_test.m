function msm_to_st_test ( )

%*****************************************************************************80
%
%% MSM_TO_ST_TEST runs the MSM_TO_ST tests.
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
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_ST_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MSM_TO_ST library.\n' );

  msm_to_st_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_ST_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
