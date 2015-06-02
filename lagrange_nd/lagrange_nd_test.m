function lagrange_nd_test ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST tests the LAGRANGE_ND library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the LAGRANGE_ND library.\n' );

  lagrange_nd_test01 ( );
  lagrange_nd_test02 ( );
  lagrange_nd_test03 ( );
  lagrange_nd_test04 ( );
  lagrange_nd_test05 ( );
  lagrange_nd_test06 ( );
  lagrange_nd_test07 ( );
  lagrange_nd_test08 ( );
  lagrange_nd_test09 ( );
  lagrange_nd_test10 ( );

  option = 0
  lagrange_nd_test11 ( option );

  option = 1
  lagrange_nd_test11 ( option );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

