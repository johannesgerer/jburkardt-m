function cg_rc_test02 ( )

%*****************************************************************************80
%
%% CG_RC_TEST02 tests CG_RC with the Wathen matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2013
%
%  Author:
%
%    John Burkardt
%
  n = 79;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_RC_TEST02\n' );
  fprintf ( 1, '  Use CG_RC to solve a linear system\n' );
  fprintf ( 1, '  involving the Wathen matrix.\n' );

  nx = 5;
  ny = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NX = %d\n', nx );
  fprintf ( 1, '  NY = %d\n', ny );
  fprintf ( 1, '  N  = %d\n', n );

  a = wathen ( nx, ny, n );

  seed = 123456789;
  [ x_exact, seed ] = r8vec_uniform_01 ( n, seed );

  size ( x_exact )
  size ( a )
  b(1:n) = a(1:n,1:n) * x_exact(1:n);

  x = zeros ( n, 1 );
%
%  Parameters we need for the stopping test.
%
  it = 0;
  it_max = 30;
  tol = 1.0E-05;
  bnrm2 = norm ( b(1:n) );
%
%  Set parameters for CG_RC.
%
  r = zeros ( n, 1 );
  z = zeros ( n, 1 );
  p = zeros ( n, 1 );
  q = zeros ( n, 1 );
  job = 1;
%
%  Repeatedly call CG_RC, and on return, do what JOB tells you.
%
  while ( 1 )

    [ x, r, z, p, q, job ] = cg_rc ( n, b, x, r, z, p, q, job );
%
%  Compute q = A * p.
%
    if ( job == 1 )

      q = a * p;
%
%  Solve M * z = r;
%
    elseif ( job == 2 )

      for i = 1 : n
        z(i) = r(i) / a(i,i);
      end
%
%  Compute r = r - A * x.
%
    elseif ( job == 3 )

      r = r - a * x;
%
%  Stopping test.
%
    elseif ( job == 4 )

      rnrm2 = norm ( r );

      if ( bnrm2 == 0.0 )
        if ( rnrm2 <= tol )
          break
        end
      else
        if ( rnrm2 <= tol * bnrm2 )
          break
        end
      end

      it = it + 1;

      if ( it_max <= it )
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Iteration limit exceeded.\n' );
        fprintf ( 1, '  Terminating early.\n' );
        break
      end

    end

    job = 2;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations was %d\n', it );
  fprintf ( 1, '  Estimated error is %g\n', rnrm2 );
  err = max ( abs ( x_exact(1:n) - x(1:n) ) );
  fprintf ( 1, '  Loo error is %g\n', err );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X(I)         X_EXACT(I)        B(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %14f  %14f  %14f\n', ...
      i, x(i), x_exact(i), b(i) );
  end

  return
  end
