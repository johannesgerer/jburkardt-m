function test007 ( dim_num, n, z )

%*****************************************************************************80
%
%% TEST007 tests BETA_MEASURE.
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
  fprintf ( 1, 'TEST007\n' );
  fprintf ( 1, '  BETA_MEASURE computes the BETA measure of quality.\n' );
  fprintf ( 1, '  Relative spacing deviation    BETA = %14f\n', ...
    beta_measure ( dim_num, n, z ) );

  return
end
