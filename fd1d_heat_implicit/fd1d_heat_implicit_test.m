function fd1d_heat_implicit_test ( )

%*****************************************************************************80
%
%% FD1D_HEAT_IMPLICIT_TEST tests the FD1D_HEAT_IMPLICIT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 January 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_HEAT_IMPLICIT_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the FD1D_HEAT_IMPLICIT library.\n' );

  fd1d_heat_implicit_test01 ( );
  fd1d_heat_implicit_test02 ( );
  fd1d_heat_implicit_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_HEAT_IMPLICIT_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
