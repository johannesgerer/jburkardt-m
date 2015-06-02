function laplacian_test ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST tests the LAPLACIAN library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAPLACIAN_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the LAPLACIAN library.\n' );

  laplacian_test01 ( );
  laplacian_test02 ( );
  laplacian_test03 ( );
  laplacian_test04 ( );
  laplacian_test05 ( );
  laplacian_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAPLACIAN_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

