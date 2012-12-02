function sine_transform_test ( )

%*****************************************************************************80
%
%% SINE_TRANSFORM_TEST tests SINE_TRANSFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 December 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINE_TRANSFORM_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SINE_TRANSFORM library.\n' );

  sine_transform_test01 ( );
  sine_transform_test02 ( );
  sine_transform_test03 ( );
  sine_transform_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINE_TRANSFORM_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



