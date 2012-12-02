function [ abd, ipvt, info ] = sgbfa ( abd, lda, n, ml, mu )

%*****************************************************************************80
%
%% SGBFA factors a real band matrix by elimination.
%
%  Discussion:
%
%    SGBFA is usually called by SGBCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
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
%    Input, real ABD(LDA,N), the matrix in band
%    storage.  The columns of the matrix are stored in the columns of ABD
%    and the diagonals of the matrix are stored in rows ML+1 through
%    2*ML+MU+1 of ABD.
%
%    Input, integer LDA, the leading dimension of the array ABD.
%    2*ML + MU + 1 <= LDA is required.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, MU, the number of diagonals below and above the
%    main diagonal.  0 <= ML < N, 0 <= MU < N.
%
%    Output, real ABD(LDA,N), an upper triangular matrix in band storage
%    and the multipliers which were used to obtain it.  The factorization
%    can be written A = L*U where L is a product of permutation and unit lower
%    triangular matrices and U is upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO, error flag.
%    0, normal value.
%    K, if U(K,K) == 0.0D+00.  This is not an error condition for this
%      subroutine, but it does indicate that SGBSL will divide by zero if
%      called.  Use RCOND in SGBCO for a reliable indication of singularity.
%
  m = ml + mu + 1;
  info = 0;
%
%  Zero initial fill-in columns.
%
  j0 = mu + 2;
  j1 = min ( n, m ) - 1;

  for jz = j0 : j1
    i0 = m + 1 - jz;
    abd(i0:ml,jz) = 0.0;
  end

  jz = j1;
  ju = 0;
%
%  Gaussian elimination with partial pivoting.
%
  for k = 1 : n-1
%
%  Zero out the next fill-in column.
%
    jz = jz + 1;
    if ( jz <= n )
      abd(1:ml,jz) = 0.0;
    end
%
%  Find L = pivot index.
%
    lm = min ( ml, n-k );
    l = isamax ( lm+1, abd(m:m+lm,k), 1 ) + m - 1;
    ipvt(k) = l + k - m;
%
%  Zero pivot implies this column already triangularized.
%
    if ( abd(l,k) == 0.0 )

      info = k;
%
%  Interchange if necessary.
%
    else

      if ( l ~= m )
        t = abd(l,k);
        abd(l,k) = abd(m,k);
        abd(m,k) = t;
      end
%
%  Compute multipliers.
%
      abd(m+1:m+lm,k) = - abd(m+1:m+lm,k) / abd(m,k);
%
%  Row elimination with column indexing.
%
      ju = min ( max ( ju, mu+ipvt(k) ), n );
      mm = m;

      for j = k+1 : ju
        l = l - 1;
        mm = mm - 1;
        t = abd(l,j);
        if ( l ~= mm )
          abd(l,j) = abd(mm,j);
          abd(mm,j) = t;
        end
        abd(mm+1:mm+lm,j) = ...
          saxpy ( lm, t, abd(m+1:m+lm,k), 1, abd(mm+1:mm+lm,j), 1 );
      end

    end

  end

  ipvt(n) = n;

  if ( abd(m,n) == 0.0 )
    info = n;
  end

  return
end
