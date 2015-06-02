function fem1d_bvp_quadratic_test ( )

%*****************************************************************************80
%
%% FEM1D_BVP_QUADRATIC_TEST tests the FEM1D_BVP_QUADRATIC library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_QUADRATIC_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM1D_BVP_QUADRATIC library.\n' );

  fem1d_bvp_quadratic_test01 ( );
  fem1d_bvp_quadratic_test02 ( );
  fem1d_bvp_quadratic_test03 ( );
  fem1d_bvp_quadratic_test04 ( );
  fem1d_bvp_quadratic_test05 ( );
  fem1d_bvp_quadratic_test06 ( );
  fem1d_bvp_quadratic_test07 ( );
  fem1d_bvp_quadratic_test08 ( );
  fem1d_bvp_quadratic_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_QUADRATIC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

