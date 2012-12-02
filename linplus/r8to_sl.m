function x = r8to_sl ( n, a, b, job )

%*****************************************************************************80
%
%% R8TO_SL solves a R8TO system.
%
%  Discussion:
%
%    The R8TO storage format is used for a Toeplitz matrix, which is constant
%    along diagonals.  Thus, in an N by N Toeplitz matrix, there are at most 
%    2*N-1 distinct entries.  The format stores the N elements of the first
%    row, followed by the N-1 elements of the first column (skipping the
%    entry in the first row).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(2*N-1), the R8TO matrix.
%
%    Input, real B(N) the right hand side vector.
%
%    Input, integer JOB,
%    0 to solve A*X=B,
%    nonzero to solve A'*X=B.
%
%    Output, real X(N), the solution vector.
%
  if ( n < 1 )
    x = [];
    return
  end
%
%  Solve the system with the principal minor of order 1.
%
  r1 = a(1);
  x(1) = b(1) / r1;

  if ( n == 1 )
    return
  end
%
%  Recurrent process for solving the system with the Toeplitz matrix.
%
  for nsub = 2 : n
%
%  Compute multiples of the first and last columns of the inverse of
%  the principal minor of order NSUB.
%
    if ( job == 0 )
      r5 = a(n+nsub-1);
      r6 = a(nsub);
    else
      r5 = a(nsub);
      r6 = a(n+nsub-1);
    end

    if ( 2 < nsub )

      c1(nsub-1) = r2;

      for i = 1 : nsub-2
        if ( job == 0 )
          r5 = r5 + a(n+i) * c1(nsub-i);
          r6 = r6 + a(i+1) * c2(i);
        else
          r5 = r5 + a(i+1) * c1(nsub-i);
          r6 = r6 + a(n+i) * c2(i);
        end
      end

    end

    r2 = -r5 / r1;
    r3 = -r6 / r1;
    r1 = r1 + r5 * r3;

    if ( 2 < nsub )

      r6 = c2(1);
      c2(nsub-1) = 0.0E+00;

      for i = 2 : nsub-1
        r5 = c2(i);
        c2(i) = c1(i) * r3 + r6;
        c1(i) = c1(i) + r6 * r2;
        r6 = r5;
      end

    end

    c2(1) = r3;
%
%  Compute the solution of the system with the principal minor of order NSUB.
%
    if ( job == 0 )
      r5 = a(n+1:n+nsub-1) * x(nsub-1:-1:1)';
    else
      r5 = a(2:nsub) * x(nsub-1:-1:1)';
    end

    r6 = ( b(nsub) - r5 ) / r1;

    x(1:nsub-1) = x(1:nsub-1) + c2(1:nsub-1) * r6;
    x(nsub) = r6;

  end

  return
end
