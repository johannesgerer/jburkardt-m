function cg_rc_test01 ( )

%*****************************************************************************80
%
%% CG_RC_TEST01 uses CG_RC for the simple 1, -2, 1 matrix.
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
  n = 21;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_RC_TEST01\n' );
  fprintf ( 1, '  Use CG_RC on the 1, -2, 1 matrix.\n' );
%
%  In order to specify the right hand side, pick an exact solution,
%  and multiply by the matrix.
%
  x_exact = zeros ( n, 1 );
  for i = 1 : n
    angle = 2.0 * pi * ( i - 1 ) / ( n - 1 );
    x_exact(i) = sin ( angle );
  end

  b = zeros ( n, 1 );
  b(1:n) = - 2.0 * x_exact(1:n);
  b(1:n-1) = b(1:n-1) + x_exact(2:n);
  b(2:n) = b(2:n) + x_exact(1:n-1);
%
%  Here is the initial guess for the solution.
%
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

      q(1:n) = - 2.0 * p(1:n);
      q(1:n-1) = q(1:n-1) + p(2:n);
      q(2:n) = q(2:n) + p(1:n-1);
%
%  Solve M * z = r;
%
    elseif ( job == 2 )

      z(1:n) = r(1:n) / ( -2.0 );
%
%  Compute r = r - A * x.
%
    elseif ( job == 3 )

      r(1:n) = r(1:n) + 2.0 * x(1:n);
      r(1:n-1) = r(1:n-1) - x(2:n);
      r(2:n) = r(2:n) - x(1:n-1);
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
