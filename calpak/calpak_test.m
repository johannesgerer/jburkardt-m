function calpak_test ( )

%*****************************************************************************80
%
%% CALPAK_TEST tests CALPAK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CALPAK library.\n' );

  calpak_test0005 ( );
  calpak_test0007 ( );
  calpak_test001 ( );
  calpak_test002 ( );
  calpak_test003 ( );
  calpak_test004 ( );
  calpak_test005 ( );
  calpak_test006 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



