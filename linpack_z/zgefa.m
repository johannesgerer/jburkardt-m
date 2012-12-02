function [ a, ipvt, info ] = zgefa ( a, lda, n )

%*****************************************************************************80
%
%% ZGEFA factors a complex matrix by Gaussian elimination.
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
%    Input, complex A(LDA,N), the matrix to be factored.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(LDA,N); an upper triangular matrix and the multipliers
%    which were used to obtain it.  The factorization can be written A = L*U
%    where L is a product of permutation and unit lower triangular matrices
%    and U is upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO,
%    0, normal value.
%    K, if U(K,K) == 0.0.  This is not an error condition for this
%    subroutine, but it does indicate that ZGESL or ZGEDI will divide by zero
%    if called.  Use RCOND in ZGECO for a reliable indication of singularity.
%

%
%  Gaussian elimination with partial pivoting.
%
  info = 0;

  for k = 1 : n - 1
%
%  Find L = pivot index.
%
    l = izamax ( n-k+1, a(k:n,k), 1 ) + k - 1;
    ipvt(k) = l;
%
%  Zero pivot implies this column already triangularized.
%
    if ( zabs1 ( a(l,k) ) == 0.0 )
      info = k;
      continue;
    end
%
%  Interchange if necessary.
%
    if ( l ~= k )
      temp = a(l,k);
      a(l,k) = a(k,k);
      a(k,k) = temp;
    end
%
%  Compute multipliers
%
    a(k+1:n,k) = - a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing
%
    for j = k+1 : n
      t = a(l,j);
      if ( l ~= k )
        a(l,j) = a(k,j);
        a(k,j) = t;
      end
      a(k+1:n,j) = a(k+1:n,j) + t * a(k+1:n,k);
    end

  end

  ipvt(n) = n;

  if ( zabs1 ( a(n,n) ) == 0.0 )
    info = n;
  end

  return
end
