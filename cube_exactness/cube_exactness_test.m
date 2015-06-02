function cube_exactness_test ( )

%*****************************************************************************80
%
%% CUBE_EXACTNESS_TEST tests the CUBE_EXACTNESS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_EXACTNESS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CUBE_EXACTNESS library.\n' );

  cube_exactness_test01 ( );
  cube_exactness_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_EXACTNESS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
