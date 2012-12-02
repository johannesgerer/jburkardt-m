function test085 ( dim_num, n, z )

%*****************************************************************************80
%
%% TEST085 tests R0_MEASURE.
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
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  R0_MEASURE computes the R0 measure of quality.\n' );
  fprintf ( 1, '  The Riesz S = 0 energy measure  R0 = %14f\n', ...
    r0_measure ( dim_num, n, z ) );

  return
end
