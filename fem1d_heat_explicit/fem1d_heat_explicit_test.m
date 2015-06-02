function fem1d_heat_explicit_test ( )

%*****************************************************************************80
%
%% FEM1D_HEAT_EXPLICIT_TEST tests the FEM1D_HEAT_EXPLICIT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_EXPLICIT_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the FEM1D_HEAT_EXPLICIT library.\n' );

  fem1d_heat_explicit_test01 ( );
  fem1d_heat_explicit_test02 ( );
  fem1d_heat_explicit_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_EXPLICIT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



