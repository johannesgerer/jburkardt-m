function pink_noise_test ( )

%*****************************************************************************80
%
%% PINK_NOISE_TEST tests the PINK_NOISE routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PINK_NOISE_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PINK_NOISE library.\n' );

  pink_noise_test01 ( );
  pink_noise_test02 ( );
  pink_noise_test03 ( );
  pink_noise_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PINK_NOISE_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
