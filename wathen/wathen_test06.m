function wathen_test06 ( )

%*****************************************************************************80
%
%% WATHEN_TEST06 times WATHEN_GE assembly and solution.
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
  fprintf ( 1, 'WATHEN_TEST06\n' );
  fprintf ( 1, '  For various problem sizes, \n' );
  fprintf ( 1, '  time the assembly and factorization of a Wathen system\n' );
  fprintf ( 1, '  using the WATHEN_GE function.\n' );
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
    storage_ge = n * n;
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
    [ a, seed ] = wathen_ge ( nx, ny, n, seed );
    t1 = toc;
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
    fprintf ( 1, '  %4d      %4d  %6d  %8d  %10.2e  %10.2e  %10.2e\n', ...
      nx, nx * ny, n, storage_ge, t1, t2, e );
%
%  Ready for next iteration.
%
    nx = nx * 2;
    ny = ny * 2;

  end

  return
end

