function sor_test ( )

%*****************************************************************************80
%
%% SOR_TEST tests the SOR library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SOR_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SOR library.\n' );

  w = 0.5;
  sor_test01 ( w );
  pause

  w = 1.0;
  sor_test01 ( w );
  pause

  w = 1.5;
  sor_test01 ( w );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SOR_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
