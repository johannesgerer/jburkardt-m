function hammersley_test ( )

%*****************************************************************************80
%
%% HAMMERSLEY_TEST tests the HAMMERSLEY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAMMERSLEY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HAMMERSLEY library.\n' );

  hammersley_test005 ( );
  hammersley_test01 ( );
  hammersley_test02 ( );
  hammersley_test03 ( );
  hammersley_test04 ( );
  hammersley_test05 ( );
  hammersley_test06 ( );
  hammersley_test07 ( );
  hammersley_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAMMERSLEY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
