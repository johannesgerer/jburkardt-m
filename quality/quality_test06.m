function test06 ( dim_num, n, z )

%*****************************************************************************80
%
%% TEST06 tests LAMBDA_MEASURE.
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  LAMBDA_MEASURE computes the LAMBDA measure of quality.\n' );
  fprintf ( 1, '  The COV measure             Lambda = %14f\n', ...
    lambda_measure ( dim_num, n, z ) );

  return
end
