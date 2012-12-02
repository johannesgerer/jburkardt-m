function kronrod_test ( )

%*****************************************************************************80
%
%% KRONROD_TEST tests the KRONROD functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KRONROD_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the KRONROD library.\n' );

  kronrod_test01 ( );
  kronrod_test02 ( );
  kronrod_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KRONROD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
