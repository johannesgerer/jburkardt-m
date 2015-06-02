function wathen_test09 ( )

%*****************************************************************************80
%
%% WATHEN_TEST09 times WATHEN_SPARSE and WATHEN_DAVIS assembly and solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST09\n' );
  fprintf ( 1, '  For various problem sizes, \n' );
  fprintf ( 1, '  time the assembly and factorization of a Wathen system\n' );
  fprintf ( 1, '  using the WATHEN_SPARSE and WATHEN_DAVIS functions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                   NX    Elements   Nodes   Storage    Assembly      Factor      Error\n' );

  nx = 32;
  ny = 32;

  for test = 6 : 8
%
%  Compute the number of unknowns.
%
    n = wathen_order ( nx, ny );
%
%  Set up a random solution X1.
%
    seed = 123456789;
    [ x1, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Compute the matrix.
%
    seed = 123456789;
    tic;
    a = wathen_sparse ( nx, ny, n, seed );
    t1 = toc;
    storage = nnz ( a );
%
%  Compute the corresponding right hand side B.
%
    b = a * x1;
%
%  Solve the system.
%
    tic;
    x2 = a \ b;
    t2 = toc;
%
%  Compute the maximum solution error.
%
    e = max ( abs ( x1 - x2 ) );
%
%  Report.
%
    fprintf ( 1, '\n' );
    fprintf ( 1, '  WATHEN_SPARSE  %4d      %6d  %6d  %8d  %10.2e  %10.2e  %10.2e\n', ...
      nx, nx * ny, n, storage, t1, t2, e );
%
%  Use the same random number stream for each matrix.
%
    seed = 123456789;
    rng ( seed );
%
%  Compute the matrix.
%
    seed = 123456789;
    tic;
    [ a, seed ] = wathen_davis ( nx, ny, n, seed );
    t1 = toc;
    storage = nnz ( a );
%
%  Compute the corresponding right hand side B.
%
    b = a * x1;
%
%  Solve the system.
%
    tic;
    x2 = a \ b;
    t2 = toc;
%
%  Compute the maximum solution error.
%
    e = max ( abs ( x1 - x2 ) );
%
%  Report.
%
    fprintf ( 1, '  WATHEN_DAVIS   %4d      %6d  %6d  %8d  %10.2e  %10.2e  %10.2e\n', ...
      nx, nx * ny, n, storage, t1, t2, e );
%
%  Ready for next iteration.
%
    nx = nx * 2;
    ny = ny * 2;

  end

  return
end

