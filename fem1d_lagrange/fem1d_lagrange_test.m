function fem1d_lagrange_test ( )

%*****************************************************************************80
%
%% FEM1D_LAGRANGE_TEST tests the FEM1D_LAGRANGE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_LAGRANGE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM1D_LAGRANGE library.\n' );

  legendre_set_test ( );
  lagrange_value_test ( );
  lagrange_derivative_test ( );

  x_num = 11;
  q_num = 5;
  fem1d_lagrange_stiffness_test ( x_num, q_num );

  x_num = 11;
  q_num = 10;
  fem1d_lagrange_stiffness_test ( x_num, q_num );

%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_LAGRANGE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
