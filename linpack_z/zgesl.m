function b = zgesl ( a, lda, n, ipvt, b, job )

%*****************************************************************************80
%
%% ZGESL solves a complex system factored by ZGECO or ZGEFA.
%
%  Discussion:
%
%    A division by zero will occur if the input factor contains a
%    zero on the diagonal.  Technically this indicates singularity
%    but it is often caused by improper arguments or improper
%    setting of LDA.  It will not occur if the subroutines are
%    called correctly and if ZGECO has set 0.0 < RCOND
%    or ZGEFA has set INFO == 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%
%  Parameters:
%
%    Input, complex A(LDA,N), the factored matrix information,
%    as output from ZGECO or ZGEFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from ZGECO or ZGEFA.
%
%    Input, complex B(N), the right hand side.
%
%    Input, integer JOB.
%    0, to solve A*X = B,
%    nonzero, to solve hermitian(A)*X = B where hermitian(A) is the
%    conjugate transpose.
%
%    Output, complex B(N), the solution.
%
  if ( job == 0 )
%
%  JOB = 0, solve A * X = B.
%
%  First solve L * Y = B.
%
    for k = 1 : n-1
      l = ipvt(k);
      t = b(l);
      if ( l ~= k )
        b(l) = b(k);
        b(k) = t;
      end
      b(k+1:n) = b(k+1:n) + t * a(k+1:n,k);
    end
%
%  Now solve U * X = Y.
%
    for k = n : -1 : 1
      b(k) = b(k) / a(k,k);
      t = -b(k);
      b(1:k-1) = b(1:k-1) + t * a(1:k-1,k);
    end

  else
%
%  JOB nonzero, solve hermitian(A) * X = B.
%
%  First solve hermitian(U) * Y = B.
%
    for k = 1 : n
      t = a(1:k-1,k) * b(1:k-1)';
      b(k) = ( b(k) - t ) / a(k,k)';
    end
%
%  Now solve hermitian(L) * X = Y.
%
    for k = n-1 : -1 : 1
      b(k) = b(k) + a(k+1:n,k) * b(k+1:n)';
      l = ipvt(k);
      if ( l ~= k )
        t = b(l);
        b(l) = b(k);
        b(k) = t;
      end
    end

  end

  return
end
