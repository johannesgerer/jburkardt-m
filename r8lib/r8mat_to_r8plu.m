function [ pivot, lu, info ] = r8mat_to_r8plu ( n, a )

%*****************************************************************************80
%
%% R8MAT_TO_R8PLU factors a general matrix.
%
%  Discussion:
%
%    This routine is a simplified version of the LINPACK routine DGEFA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(N,N), the matrix to be factored.
%
%    Output, integer PIVOT(N), a vector of pivot indices.
%
%    Output, real LU(N,N), an upper triangular matrix U and
%    the multipliers L which were used to obtain it.  The factorization
%    can be written A = L * U, where L is a product of permutation and
%    unit lower triangular matrices and U is upper triangular.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  lu(1:n,1:n) = a(1:n,1:n);

  info = 0;

  for k = 1 : n-1
%
%  Find L, the index of the pivot row.
%
    l = k;
    for i = k+1 : n
      if ( abs ( lu(l,k) ) < abs ( lu(i,k) ) )
        l = i;
      end
    end

    pivot(k) = l;
%
%  If the pivot index is zero, the algorithm has failed.
%
    if ( lu(l,k) == 0.0 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8MAT_TO_R8PLU - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return
    end
%
%  Interchange rows L and K if necessary.
%
    if ( l ~= k )
      temp    = lu(l,k);
      lu(l,k) = lu(k,k);
      lu(k,k) = temp;
    end
%
%  Normalize the values that lie below the pivot entry A(K,K).
%
    lu(k+1:n,k) = -lu(k+1:n,k) / lu(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n

      if ( l ~= k )
        temp    = lu(l,j);
        lu(l,j) = lu(k,j);
        lu(k,j) = temp;
      end

      lu(k+1:n,j) = lu(k+1:n,j) + lu(k+1:n,k) * lu(k,j);

    end

  end

  pivot(n) = n;

  if ( lu(n,n) == 0.0 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_TO_R8PLU - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
  end

  return
end
