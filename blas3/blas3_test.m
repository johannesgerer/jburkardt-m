function blas3_test ( )

%*****************************************************************************80
%
%% BLAS3_TEST tests the BLAS3 library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../blas0' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS3_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLAS3 library.\n' );

  blas3_test01 ( );
  blas3_test02 ( );
  blas3_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS3_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../blas0' );

  return
end
