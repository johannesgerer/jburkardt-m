function test04 ( dim_num, n, z )

%*****************************************************************************80
%
%% TEST04 tests GAMMA_MEASURE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  GAMMA_MEASURE computes the GAMMA measure of quality.\n' );
  fprintf ( 1, '  The mesh ratio               Gamma = %14f\n', ...
    gamma_measure ( dim_num, n, z ) );

  return
end
