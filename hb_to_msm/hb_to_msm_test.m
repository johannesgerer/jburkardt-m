function hb_to_msm_test ( )

%*****************************************************************************80
%
%% HB_TO_MSM_TEST runs the HB_TO_MSM tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_MSM_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HB_TO_MSM library.\n' );

  hb_to_msm_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_MSM_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

