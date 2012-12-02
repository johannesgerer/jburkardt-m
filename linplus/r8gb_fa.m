function [ alu, pivot, info ] = r8gb_fa ( n, ml, mu, a )

%*****************************************************************************80
%
%% R8GB_FA performs a LINPACK-style PLU factorization of a R8GB matrix.
%
%  Discussion:
%
%    An M by N banded matrix A with lower bandwidth ML and upper bandwidth MU
%    is assumed to be entirely zero, except for the main diagonal, and
%    entries in the ML nearest subdiagonals, and MU nearest superdiagonals.
%
%    LINPACK and LAPACK "R8GB" storage for such a matrix generally includes
%    room for ML extra superdiagonals, which may be required to store
%    nonzero entries generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%    The following program segment will set up the input.
%
%      m = ml + mu + 1
%      do j = 1, n
%        i1 = max ( 1, j-mu )
%        i2 = min ( n, j+ml )
%        do i = i1, i2
%          k = i - j + m
%          a(k,j) = afull(i,j)
%        end do
%      end do
%
%    This uses rows ML+1 through 2*ML+MU+1 of the array A.
%    In addition, the first ML rows in the array are used for
%    elements generated during the triangularization.
%    The total number of rows needed in A is 2*ML+MU+1.
%    The ML+MU by ML+MU upper left triangle and the
%    ML by ML lower right triangle are not referenced.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2003
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(2*ML+MU+1,N), the matrix in band storage.  The
%    columns of the matrix are stored in the columns of the array,
%    and the diagonals of the matrix are stored in rows ML+1 through
%    2*ML+MU+1.
%
%    Output, real ALU(2*ML+MU+1,N), the LU factors in band storage.  
%    The L and U matrices are stored in a single array.
%
%    Output, integer PIVOT(N), the pivot vector.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  alu = a(1:2*ml+mu+1,1:n);

  m = ml + mu + 1;
  info = 0;
%
%  Zero out the initial fill-in columns.
%
  j0 = mu + 2;
  j1 = min ( n, m ) - 1;

  for jz = j0 : j1
    i0 = m + 1 - jz;
    alu(i0:ml,jz) = 0.0E+00;
  end

  jz = j1;
  ju = 0;

  for k = 1 : n - 1
%
%  Zero out the next fill-in column.
%
    jz = jz + 1;
    if ( jz <= n )
      alu(1:ml,jz) = 0.0;
    end
%
%  Find L = pivot index.
%
    lm = min ( ml, n-k );

    l = m;

    for j = m+1 : m+lm
      if ( abs ( alu(l,k) ) < abs ( alu(j,k) ) )
        l = j;
      end
    end

    pivot(k) = l + k - m;
%
%  Zero pivot implies this column already triangularized.
%
    if ( alu(l,k) == 0.0 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8GB_FA - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return;
    end
%
%  Interchange if necessary.
%
    t = alu(l,k);
    alu(l,k) = alu(m,k);
    alu(m,k) = t;
%
%  Compute multipliers.
%
    alu(m+1:m+lm,k) = - alu(m+1:m+lm,k) / alu(m,k);
%
%  Row elimination with column indexing.
%
    ju = max ( ju, mu+pivot(k) );
    ju = min ( ju, n );
    mm = m;

    for j = k+1 : ju

      l = l - 1;
      mm = mm - 1;

      if ( l ~= mm )
        t = alu(l,j);
        alu(l,j) = alu(mm,j);
        alu(mm,j) = t;
      end

      alu(mm+1:mm+lm,j) = alu(mm+1:mm+lm,j) + alu(mm,j) * alu(m+1:m+lm,k);

    end

  end

  pivot(n) = n;

  if ( alu(m,n) == 0.0 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8GB_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
  end

  return
end
