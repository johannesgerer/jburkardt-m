function histogram_discrete_test ( )

%*****************************************************************************80
%
%% HISTOGRAM_DISCRETE_TEST tests the HISTOGRAM_DISCRETE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HISTOGRAM_DISCRETE_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the HISTOGRAM_DISCRETE library.\n' );

  setup_discrete_test ( );
  pdf_discrete_test ( );
  cdf_discrete_test ( );

  s_num = 50;
  bigger_test ( s_num );

  s_num = 200;
  gaussian_test ( s_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HISTOGRAM_DISCRETE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

