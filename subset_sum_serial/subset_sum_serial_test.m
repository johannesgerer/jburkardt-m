function subset_sum_serial_test ( )

%*****************************************************************************80
%
%% SUBSET_SUM_SERIAL_TEST tests the SUBSET_SUM_SERIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_SERIAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SUBSET_SUM_SERIAL library.\n' );

  subset_sum_serial_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_SERIAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



