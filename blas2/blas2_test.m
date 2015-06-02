function blas2_test ( )

%*****************************************************************************80
%
%% BLAS2_TEST tests the BLAS2 library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2014
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../blas0' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS2_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLAS2 library.\n' );

  blas2_test01 ( );
  blas2_test05 ( );
  blas2_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS2_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../blas0' );

  return
end
