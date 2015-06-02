function wathen_test07 ( )

%*****************************************************************************80
%
%% WATHEN_TEST07 times WATHEN_GB assembly and solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST07\n' );
  fprintf ( 1, '  For various problem sizes, \n' );
  fprintf ( 1, '  time the assembly and factorization of a Wathen system\n' );
  fprintf ( 1, '  using the WATHEN_GB function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    NX  Elements   Nodes   Storage    Assembly      ' );
  fprintf ( 1, 'Factor      Error\n' );
  fprintf ( 1, '\n' );

  nx = 1;
  ny = 1;

  for test = 1 : 6
%
%  Compute the number of unknowns.
%
    n = wathen_order ( nx, ny );
%
%  Compute the bandwidth.
%
    [ ml, md, mu ] = wathen_bandwidth ( nx, ny );
    storage = ( 2 * ml + mu + 1 ) * n;
%
%  Set up a random solution X1.
%
    seed = 123456789;
    [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the matrix, and measure the storage required.
%
    seed = 123456789;
    tic;
    [ a, seed ] = wathen_gb ( nx, ny, n, seed );
    t1 = toc;
%
%  Compute the corresponding right hand side B.
%
    b = mv_gb ( n, n, ml, mu, a, x1 );
%
%  Solve the system.
%
    tic;
    lda = 2 * ml + mu + 1;
    [ alu, ipvt, info ] = dgbfa ( a, lda, n, ml, mu );
    job = 0;
    x2 = dgbsl ( alu, lda, n, ml, mu, ipvt, b, job );
    t2 = toc;
%
%  Compute the maximum solution error.
%
    e = max ( abs ( x1 - x2 ) );
%
%  Report.
%
    fprintf ( 1, '  %4d      %4d  %6d  %8d  %10.2e  %10.2e  %10.2e\n', ...
      nx, nx * ny, n, storage, t1, t2, e );
%
%  Ready for next iteration.
%
    nx = nx * 2;
    ny = ny * 2;

  end

  return
end

