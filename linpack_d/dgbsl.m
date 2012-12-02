function b = dgbsl ( abd, lda, n, ml, mu, ipvt, b, job )

%*****************************************************************************80
%
%% DGBSL solves a real banded system factored by DGBCO or DGBFA.
%
%  Discussion:
%
%    DGBSL can solve either A * X = B  or  A' * X = B.
%
%    A division by zero will occur if the input factor contains a
%    zero on the diagonal.  Technically this indicates singularity
%    but it is often caused by improper arguments or improper
%    setting of LDA.  It will not occur if the subroutines are
%    called correctly and if DGBCO has set 0.0 < RCOND
%    or DGBFA has set INFO == 0.
%
%    To compute inverse(A) * C  where C is a matrix with P columns:
%
%      call dgbco ( abd, lda, n, ml, mu, ipvt, rcond, z )
%
%      if ( rcond is too small ) then
%        exit
%      end if
%
%      do j = 1, p
%        call dgbsl ( abd, lda, n, ml, mu, ipvt, c(1,j), 0 )
%      end do
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2005
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
%    Input, real ABD(LDA,N), the output from DGBCO or DGBFA.
%
%    Input, integer LDA, the leading dimension of the array ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, MU, the number of diagonals below and above the
%    main diagonal.  0 <= ML < N, 0 <= MU < N.
%
%    Input, integer IPVT(N), the pivot vector from DGBCO or DGBFA.
%
%    Input, real B(N), the right hand side.
%
%    Input, integer JOB, job choice.
%    0, solve A*X=B.
%    nonzero, solve A'*X=B.
%
%    Output, real B(N), the solution.
%
  m = mu + ml + 1;
%
%  JOB = 0, Solve A * x = b.
%
%  First solve L * y = b.
%
  if ( job == 0 )

    if ( 0 < ml )

      for k = 1 : n-1
        lm = min ( ml, n-k );
        l = ipvt(k);
        t = b(l);
        if ( l ~= k )
          b(l) = b(k);
          b(k) = t;
        end
        b(k+1:k+lm) = daxpy ( lm, t, abd(m+1:m+lm,k), 1, b(k+1:k+lm), 1 );
      end

    end
%
%  Now solve U * x = y.
%
    for k = n : -1 : 1
      b(k) = b(k) / abd(m,k);
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      t = -b(k);
      b(lb:lb+lm-1) = daxpy ( lm, t, abd(la:la+lm-1,k), 1, b(lb:lb+lm-1), 1 );
    end
%
%  JOB nonzero, solve A' * x = b.
%
%  First solve U' * y = b.
%
  else

    for k = 1 : n
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      t = b(lb:lb+lm-1) * abd(la:la+lm-1,k);
      b(k) = ( b(k) - t ) / abd(m,k);
    end
%
%  Now solve L' * x = y.
%
    if ( 0 < ml )

      for k = n-1 : -1 : 1
        lm = min ( ml, n-k );
        b(k) = b(k) + b(k+1:k+lm) * abd(m+1:m+lm,k);
        l = ipvt(k);
        if ( l ~= k )
          t = b(l);
          b(l) = b(k);
          b(k) = t;
        end
      end

    end

  end

  return
end
