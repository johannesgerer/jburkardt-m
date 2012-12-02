function geompack_test ( )

%*****************************************************************************80
%
%% GEOMPACK_TEST tests GEOMPACK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMPACK_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the GEOMPACK library.\n' );

  geompack_test005 ( );
  geompack_test01 ( );
  geompack_test02 ( );
  geompack_test03 ( );
  geompack_test05 ( );
  geompack_test06 ( );
  geompack_test07 ( );
  geompack_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMPACK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
