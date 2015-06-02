function hypersphere_integrals_test ( )

%*****************************************************************************80
%
%% HYPERSPHERE_INTEGRALS_TEST tests the HYPERSPHERE_INTEGRALS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_INTEGRALS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HYPERSPHERE_INTEGRALS library.\n' );

  hypersphere_integrals_test01 ( );
  hypersphere_integrals_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_INTEGRALS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
