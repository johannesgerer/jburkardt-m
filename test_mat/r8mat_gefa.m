function [ a, pivot, info ] = r8mat_gefa ( a, n )

%*****************************************************************************80
%
%% R8MAT_GEFA factors a general matrix.
%
%  Discussion:
%
%    This is a simplified version of the LINPACK routine DGEFA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real A(N,N), the matrix to be factored.
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Output, real A(N,N), an upper triangular matrix and the multipliers
%    which were used to obtain it.  The factorization can be written
%    A = L * U, where L is a product of permutation and unit lower
%    triangular matrices and U is upper triangular.
%
%    Output, integer PIVOT(N), a vector of pivot indices.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  info = 0;
  pivot = [];

  for k = 1 : n - 1
%
%  Find L, the index of the pivot row.
%
    l = k;
    for i = k + 1 : n
      if ( abs ( a(l,k) ) < abs ( a(i,k) ) )
        l = i;
      end
    end

    pivot(k) = l;
%
%  If the pivot index is zero, the algorithm has failed.
%
    if ( a(l,k) == 0.0 )
      info = k;
      return
    end
%
%  Interchange rows L and K if necessary.
%
    if ( l ~= k )
      temp   = a(l,k);
      a(l,k) = a(k,k);
      a(k,k) = temp;
    end
%
%  Normalize the values that lie below the pivot entry A(K,K).
%
    a(k+1:n,k) = - a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing.
%
    for j = k + 1 : n

      if ( l ~= k )
        temp   = a(l,j);
        a(l,j) = a(k,j);
        a(k,j) = temp;
      end

      a(k+1:n,j) = a(k+1:n,j) + a(k+1:n,k) * a(k,j);

    end

  end

  pivot(n) = n;

  if ( a(n,n) == 0.0 )
    info = n;
  end

  return
end

