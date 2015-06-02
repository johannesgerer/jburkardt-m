function fem1d_bvp_linear_test ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST tests the FEM1D_BVP_LINEAR library.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/fem1d_bvp_linear/fem1d_bvp_linear_test.m
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
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM1D_BVP_LINEAR library.\n' );

  fem1d_bvp_linear_test01 ( );
  fem1d_bvp_linear_test02 ( );
  fem1d_bvp_linear_test03 ( );
  fem1d_bvp_linear_test04 ( );
  fem1d_bvp_linear_test05 ( );
  fem1d_bvp_linear_test06 ( );
  fem1d_bvp_linear_test07 ( );
  fem1d_bvp_linear_test08 ( );
  fem1d_bvp_linear_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST\n' );
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

