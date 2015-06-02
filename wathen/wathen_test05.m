function wathen_test05 ( )

%*****************************************************************************80
%
%% WATHEN_TEST05 measures the storage needed for the Wathen system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST05\n' );
  fprintf ( 1, '  For various problem sizes and storage schemes, \n' );
  fprintf ( 1, '  measure the storage used for the Wathen system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                   Predicted  Observed\n' );
  fprintf ( 1, '                              GE        Band      Band' );
  fprintf ( 1, '      Band    Sparse\n' );
  fprintf ( 1, '    NX  Elements   Nodes   storage     width     width' );
  fprintf ( 1, '   storage   storage\n' );
  fprintf ( 1, '\n' );

  nx = 1;
  ny = 1;

  for test = 1 : 6
%
%  Compute the number of unknowns.
%
    n = wathen_order ( nx, ny );
%
%  Predict the bandwidth.
%
    [ bl, bd, bu ] = wathen_bandwidth ( nx, ny );
    bw1 = bl + bd + bu;
%
%  Compute the matrix.
%
    seed = 123456789;
    [ a, seed ] = wathen_ge ( nx, ny, n, seed );
    [ na1, na2 ] = size ( a );
    storage_ge = na1 * na2;
    [ bw2, lb, db, ub ] = bandwidth ( na1, na2, a );
    storage_gb = ( 2 * lb + 1 + ub ) * n;
    nnz = length ( find ( a ~= 0.0 ) );
%
%  Report.
%
    fprintf ( 1, '  %4d      %4d  %6d  %8d  %8d  %8d  %8d  %8d\n', ...
      nx, nx * ny, n, storage_ge, bw1, bw2, storage_gb, nnz );
%
%  Ready for next iteration.
%
    nx = nx * 2;
    ny = ny * 2;

  end

  return
end

