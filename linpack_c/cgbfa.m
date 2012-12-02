function [ abd, ipvt, info ] = cgbfa ( abd, lda, n, ml, mu )

%*****************************************************************************80
%
%% CGBFA factors a complex band matrix by elimination.
%
%  Discussion:
%
%    CGBFA is usually called by CGBCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
%
%  Band storage:
%
%    If A is a band matrix, the following program segment
%    will set up the input.
%
%      ml = (band width below the diagonal)
%      mu = (band width above the diagonal)
%      m = ml + mu + 1
%      do j = 1, n
%        i1 = max ( 1, j - mu )
%        i2 = min ( n, j + ml )
%        do i = i1, i2
%          k = i - j + m
%          abd(k,j) = a(i,j)
%        end do
%      end do
%
%    This uses rows ML+1 through 2*ML+MU+1 of ABD.
%    In addition, the first ML rows in ABD are used for
%    elements generated during the triangularization.
%    The total number of rows needed in ABD is 2*ML+MU+1.
%    The ML+MU by ML+MU upper left triangle and the
%    ML by ML lower right triangle are not referenced.
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
%    Input, complex ABD(LDA,N), the matrix in band storage.  The columns of 
%    the matrix are stored in the columns of ABD and the diagonals of the 
%    matrix are stored in rows ML+1 through 2*ML+MU+1 of ABD.  
%
%    Input, integer LDA, the leading dimension of ABD.
%    LDA must be at least 2*ML+MU+1.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, the number of diagonals below the main diagonal.
%    0 <= ML < N.
%
%    Input, integer MU, the number of diagonals above the main diagonal.
%    0 <= MU < N.  More efficient if ML <= MU.
%
%    Output, complex ABD(LDA,N), an upper triangular matrix 
%    in band storage and the multipliers which were used to obtain it.
%    The factorization can be written A = L*U where L is a product of 
%    permutation and unit lower triangular matrices and U is upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO.
%    0, normal value.
%    K, if U(K,K) == 0.0.  This is not an error condition for this 
%    subroutine, but it does indicate that CGBSL will divide by zero if
%    called.  Use RCOND in CGBCO for a reliable indication of singularity.
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
    for i = i0 : ml
      abd(i,jz) = 0.0;
    end
  end

  jz = j1;
  ju = 0;
%
%  Gaussian elimination with partial pivoting.
%
  for k = 1 : n-1
%
%  Zero next fill-in column
%
    jz = jz + 1;
    if ( jz <= n )
      abd(1:ml,jz) = 0.0;
    end
%
%  Find L = pivot index.
%
    lm = min ( ml, n - k );
    l = icamax ( lm+1, abd(m:m+lm,k), 1 ) + m - 1;
    ipvt(k) = l + k - m;
%
%  Zero pivot implies this column already triangularized.
%
    if ( cabs1 ( abd(l,k) ) == 0.0 )
      info = k;
      continue
    end
%
%  Interchange if necessary.
%
    if ( l ~= m )
      t        = abd(l,k);
      abd(l,k) = abd(m,k);
      abd(m,k) = t;
    end
%
%  Compute multipliers.
%
    t = - 1.0 / abd(m,k);
    abd(m+1:m+lm,k) = abd(m+1:m+lm,k) * t;
%
%  Row elimination with column indexing.
%
    ju = min ( max ( ju, mu + ipvt(k) ), n );
    mm = m;
 
    for j = k+1 : ju
      l = l - 1;
      mm = mm - 1;
      t = abd(l,j);
      if ( l ~= mm )
        abd(l,j) = abd(mm,j);
        abd(mm,j) = t;
      end
      abd(mm+1:mm+lm,j) = abd(mm+1:mm+lm,j) + t * abd(m+1:m+lm,k);
    end

  end

  ipvt(n) = n;

  if ( cabs1 ( abd(m,n) ) == 0.0 )
    info = n;
  end

  return
end
