function ziggurat_test ( )

%*****************************************************************************80
%
%% ZIGGURAT_TEST tests the ZIGGURAT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZIGGURAT_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the ZIGGURAT library.\n' );
%
%  Make sure that SEED controls the sequence and can restart it.
%
  ziggurat_test001 ( );
  ziggurat_test02 ( );
  ziggurat_test03 ( );
  ziggurat_test04 ( );
%
%  Measure the time it takes to generate a lot of variables.
%
  sample_num = 100000;

  ziggurat_test05 ( sample_num );
  ziggurat_test06 ( sample_num );
  ziggurat_test07 ( sample_num );
  ziggurat_test08 ( sample_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZIGGURAT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
