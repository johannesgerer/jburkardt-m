function [ a, ipvt, info ] = dgefa ( a, lda, n )

%*****************************************************************************80
%
%% DGEFA factors a real matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt
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
%    Input, real A(LDA,N), the matrix to be factored.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix A.
%
%    Output, real A(LDA,N), an upper triangular matrix and the multipliers 
%    used to obtain it.  The factorization can be written A=L*U, where L is 
%    a product of permutation and unit lower triangular matrices, and U is 
%    upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO, singularity indicator.
%    0, normal value.
%    K, if U(K,K) == 0.  This is not an error condition for this subroutine,
%    but it does indicate that DGESL or DGEDI will divide by zero if called.
%    Use RCOND in DGECO for a reliable indication of singularity.
%

%
%  Gaussian elimination with partial pivoting.
%
  info = 0;

  for k = 1 : n - 1
%
%  Find L = pivot index.
%
    l = idamax ( n-k+1, a(k:n,k), 1 ) + k - 1;
    ipvt(k) = l;
%
%  Zero pivot implies this column already triangularized.
%
    if ( a(l,k) == 0.0 )
      info = k;
      continue
    end
%
%  Interchange if necessary.
%
    if ( l ~= k )
      [ a(l,k), a(k,k) ] = r8_swap ( a(l,k), a(k,k) );
    end
%
%  Compute multipliers.
%
    a(k+1:n,k) = - a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n
      t = a(l,j);
      if ( l ~= k )
        a(l,j) = a(k,j);
        a(k,j) = t;
      end
      a(k+1:n,j) = daxpy ( n-k, t, a(k+1:n,k), 1, a(k+1:n,j), 1 );
    end

  end

  ipvt(n) = n;

  if ( a(n,n) == 0.0 )
    info = n;
  end

  return
end
