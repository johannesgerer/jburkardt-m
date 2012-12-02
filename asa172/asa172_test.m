function asa172_test ( )

%*****************************************************************************80
%
%% ASA172_TEST tests ASA172.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA172_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the ASA172 routines.\n' );

  asa172_test01 ( );
  asa172_test02 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA172_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



