function spquad_test ( )

%*****************************************************************************80
%
%% SPQUAD_TEST tests the SPQUAD library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPQUAD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPQUAD library.\n' );

  d = 2;
  maxk = 5;
  spquad_test01 ( d, maxk );

  d = 10;
  maxk = 4;
  spquad_test01 ( d, maxk );

  d = 20;
  maxk = 3;
  spquad_test01 ( d, maxk );

  d = 30;
  maxk = 2;
  spquad_test01 ( d, maxk );

  d = 40;
  maxk = 2;
  spquad_test01 ( d, maxk );

  d = 50;
  maxk = 2;
  spquad_test01 ( d, maxk );

  spquad_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPQUAD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
