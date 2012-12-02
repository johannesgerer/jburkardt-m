function x = r8ci_sl ( n, a, b, job )

%*****************************************************************************80
%
%% R8CI_SL solves a R8CI system.
%
%  Discussion:
%
%    The R8CI storage format is used for an N by N circulant matrix.
%    An N by N circulant matrix A has the property that the entries on
%    row I appear again on row I+1, shifted one position to the right,
%    with the final entry of row I appearing as the first of row I+1.
%    The R8CI format simply records the first row of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2004
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N), the R8CI matrix.
%
%    Input, real B(N), the right hand side.
%
%    Input, integer JOB, specifies the system to solve.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real X(N), the solution of the linear system.
%
  if ( job == 0 )
%
%  Solve the system with the principal minor of order 1.
%
    r1 = a(1);
    x(1) = b(1) / r1;

    r2 = 0.0;
%
%  Recurrent process for solving the system.
%
    for nsub = 2 : n
%
%  Compute multiples of the first and last columns of
%  the inverse of the principal minor of order N.
%
      r5 = a(n+2-nsub);
      r6 = a(nsub);

      if ( 2 < nsub )

        work(nsub-1) = r2;

        for i = 1 : nsub-2
          r5 = r5 + a(n+1-i) * work(nsub-i);
          r6 = r6 + a(i+1) * work(n-1+i);
        end

      end

      r2 = -r5 / r1;
      r3 = -r6 / r1;
      r1 = r1 + r5 * r3;

      if ( 2 < nsub )

        r6 = work(n);
        work(n-1+nsub-1) = 0.0;
        for i = 2 : nsub-1
          r5 = work(n-1+i);
          work(n-1+i) = work(i) * r3 + r6;
          work(i) = work(i) + r6 * r2;
          r6 = r5;
        end

      end

      work(n) = r3;
%
%  Compute the solution of the system with the principal minor of order NSUB.
%
      r5 = 0.0;
      for i = 1 : nsub-1
        r5 = r5 + a(n+1-i) * x(nsub-i);
      end

      r6 = ( b(nsub) - r5 ) / r1;
      x(1:nsub-1) = x(1:nsub-1) + work(n:n+nsub-2) * r6;
      x(nsub) = r6;

    end

  else
%
%  Solve the system with the principal minor of order 1.
%
    r1 = a(1);
    x(1) = b(1) / r1;

    r2 = 0.0;
%
%  Recurrent process for solving the system.
%
    for nsub = 2 : n
%
%  Compute multiples of the first and last columns of
%  the inverse of the principal minor of order N.
%
      r5 = a(nsub);
      r6 = a(n+2-nsub);

      if ( 2 < nsub )

        work(nsub-1) = r2;

        for i = 1 : nsub-2
          r5 = r5 + a(i+1) * work(nsub-i);
          r6 = r6 + a(n+1-i) * work(n-1+i);
        end

      end

      r2 = -r5 / r1;
      r3 = -r6 / r1;
      r1 = r1 + r5 * r3;

      if ( 2 < nsub )

        r6 = work(n);
        work(n-1+nsub-1) = 0.0;
        for i = 2 : nsub-1
          r5 = work(n-1+i);
          work(n-1+i) = work(i) * r3 + r6;
          work(i) = work(i) + r6 * r2;
          r6 = r5;
        end

      end

      work(n) = r3;
%
%  Compute the solution of the system with the principal minor of order NSUB.
%
      r5 = 0.0E+00;
      for i = 1 : nsub-1
        r5 = r5 + a(i+1) * x(nsub-i);
      end

      r6 = ( b(nsub) - r5 ) / r1;
      for i = 1 : nsub-1
        x(i) = x(i) + work(n-1+i) * r6;
      end

      x(nsub) = r6;

    end

  end

  return
end
