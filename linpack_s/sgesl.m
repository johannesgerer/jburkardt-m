function b = sgesl ( a, lda, n, ipvt, b, job )

%*****************************************************************************80
%
%% SGESL solves a real general linear system A * X = B.
%
%  Discussion:
%
%    SGESL can solve either of the systems A * X = B or A' * X = B.
%
%    The system matrix must have been factored by SGECO or SGEFA.
%
%    A division by zero will occur if the input factor contains a
%    zero on the diagonal.  Technically this indicates singularity
%    but it is often caused by improper arguments or improper
%    setting of LDA.  It will not occur if the subroutines are
%    called correctly and if SGECO has set 0.0 < RCOND 
%    or SGEFA has set INFO == 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real A(LDA,N), the output from SGECO or SGEFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix A.
%
%    Input, integer IPVT(N), the pivot vector from SGECO or SGEFA.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer JOB.
%    0, solve A * X = B;
%    nonzero, solve A' * X = B.
%
%    Output, real B(N), the solution vector.
%

%
%  Solve A * X = B.
%
  if ( job == 0 )

    for k = 1 : n-1

      l = ipvt(k);
      t = b(l);

      if ( l ~= k )
        b(l) = b(k);
        b(k) = t;
      end

      b(k+1:n) = saxpy ( n-k, t, a(k+1:n,k)', 1, b(k+1:n), 1 );

    end

    for k = n : -1 : 1
      b(k) = b(k) / a(k,k);
      t = -b(k);
      b(1:k-1) = saxpy ( k-1, t, a(1:k-1,k)', 1, b(1:k-1), 1 );
    end

  else
%
%  Solve A' * X = B.
%
    for k = 1 : n
      t = b(1:k-1) * a(1:k-1,k);
      b(k) = ( b(k) - t ) / a(k,k);
    end

    for k = n-1 : -1 : 1

      b(k) = b(k) + b(k+1:n) * a(k+1:n,k);
      l = ipvt(k);

      if ( l ~= k )
        [ b(l), b(k) ] = r4_swap ( b(l), b(k) );
      end

    end

  end

  return
end
