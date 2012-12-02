function asa005_test ( )

%*****************************************************************************80
%
%% ASA005_TEST tests ASA005.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA005_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the ASA005 routines.\n' );

  asa005_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA005_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


