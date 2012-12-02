function cpu_timing ( n )

%*****************************************************************************80
%
%% CPU_TIMING measures execution time with CPUTIME.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CPU_TIMING:\n' );
  fprintf ( 1, '  MATLAB has a built in command called CPUTIME,\n' );
  fprintf ( 1, '  which measures the CPU time elapsed so far.\n' );
  fprintf ( 1, '  The difference of two readings measures the work done lately.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TASK #1:\n' )
  fprintf ( 1, '  Multiply two random dense matices of order N\n' );
  fprintf ( 1, '  using MATLAB''s A*B operation.\n' );
  
  A = rand ( n, n );
  B = rand ( n, n );

  t1 = cputime ( );
  C = A * B;
  t2 = cputime ( );

  f = n * n * n;
  w = f / 1000000;
  s = t2 - t1;
  r = w / s;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MegaFLOPs = %d\n', w );
  fprintf ( 1, '  Elapsed CPU time  = %f\n', s );
  fprintf ( 1, '  Rate  = %f\n', r );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TASK #2:\n' )
  fprintf ( 1, '  Multiply two random dense matices of order N\n' );
  fprintf ( 1, '  using explicit loops.\n' );
  
  A = rand ( n, n );
  B = rand ( n, n );

  t1 = cputime ( );
  for i = 1 : n
    for k = 1 : n
      C(i,k) = 0;
      for j = 1 : n
        C(i,k) = C(i,k) + A(i,j) * B(j,k);
      end
    end
  end
  t2 = cputime ( );

  f = n * n * n;
  w = f / 1000000;
  s = t2 - t1;
  r = w / s;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MegaFLOPs = %d\n', w );
  fprintf ( 1, '  Elapsed CPU time  = %f\n', s );
  fprintf ( 1, '  Rate  = %f\n', r );

  return
end
