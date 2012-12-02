function b = cgbsl ( abd, lda, n, ml, mu, ipvt, b, job )

%*****************************************************************************80
%
%% CGBSL solves a complex band system factored by CGBCO or CGBFA.
%
%  Discussion:
%
%    CGBSL can solve A * X = B or hermitan ( A ) * X = B.
%
%    A division by zero will occur if the input factor contains a
%    zero on the diagonal.  Technically this indicates singularity
%    but it is often caused by improper arguments or improper
%    setting of LDA.  It will not occur if the subroutines are
%    called correctly and if CGBCO has set 0.0 < RCOND
%    or CGBFA has set INFO = 0.
%
%    To compute inverse ( A ) * C where C is a matrix with P columns:
%
%      call cgbco(abd,lda,n,ml,mu,ipvt,rcond,z)
%
%      if ( rcond is not too small ) then
%        do j = 1, p
%          call cgbsl(abd,lda,n,ml,mu,ipvt,c(1,j),0)
%        end do
%      end if
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
%    Input, complex ABD(LDA,N), the output from CGBCO or CGBFA.
%
%    Input, integer LDA, the leading dimension of ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, the number of diagonals below the main diagonal.
%
%    Input, integer MU, the number of diagonals above the main diagonal.
%
%    Input, integer IPVT(N), the pivot vector from CGBCO or CGBFA.
%
%    Input, complex B(N), the right hand side.
%
%    Input, integer JOB.
%    0, to solve A*x = b,
%    nonzero, to solve hermitian(A)*x = b, where hermitian(A) is the 
%    conjugate transpose.
%
%    Output, complex B(N), the solution.
%
  m = mu + ml + 1;

  if ( job == 0 )
%
%  JOB = 0, solve A * X = B.
%
%  First solve L * Y = B.
%
    if ( ml ~= 0 )

      for k = 1 : n - 1

        lm = min ( ml, n - k );
        l = ipvt(k);
        t = b(l);

        if ( l ~= k )
          b(l) = b(k);
          b(k) = t;
        end

        b(k+1:k+lm) = b(k+1:k+lm) + t * abd(m+1:m+lm,k);

      end

    end
%
%  Now solve U * X = Y.
% 
    for k = n : -1 : 1
      b(k) = b(k) / abd(m,k);
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      t = -b(k);
      b(lb:lb+lm-1) = b(lb:lb+lm-1) + t * transpose ( abd(la:la+lm-1,k) );
    end

  else
%
%  JOB = nonzero, solve hermitian(A) * X = B.
%
%  First solve hermitian ( U ) * Y = B.
%
    for k = 1 : n
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      t = cdotc ( lm, abd(la,k), 1, b(lb), 1 );
      b(k) = ( b(k) - t ) / conj ( abd(m,k) );
    end
%
%  Now solve hermitian ( L ) * X = Y.
%
    if ( ml ~= 0 )

      for k = n-1 : -1 : 1

        lm = min ( ml, n - k );
        b(k) = b(k) + cdotc ( lm, abd(m+1,k), 1, b(k+1), 1 );
        l = ipvt(k);

        if ( l ~= k )
          t    = b(l);
          b(l) = b(k);
          b(k) = t;
        end

      end

    end

  end

  return
end
