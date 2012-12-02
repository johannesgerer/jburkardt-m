function [ a_lu, pivot, info ] = dge_fa ( n, a )

%*****************************************************************************80
%
%% DGE_FA performs a LINPACK style PLU factorization of a DGE matrix.
%
%  Discussion:
%
%    The DGE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    DGE_FA is a simplified version of the LINPACK routine DGEFA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(N,N), the matrix to be factored.
%
%    Output, real A_LU(N,N), an upper triangular matrix and 
%    the multipliers used to obtain it.  The factorization 
%    can be written A = L * U, where L is a product of 
%    permutation and unit lower triangular matrices and U 
%    is upper triangular.
%
%    Output, integer PIVOT(N), a vector of pivot indices.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  a_lu(1:n,1:n) = a(1:n,1:n);

  info = 0;

  for k = 1 : n-1
%
%  Find L, the index of the pivot row.
%
    l = k;
    for i = k+1 : n
      if ( abs ( a_lu(l,k) ) < abs ( a_lu(i,k) ) )
        l = i;
      end
    end

    pivot(k) = l;
%
%  If the pivot index is zero, the algorithm has failed.
%
    if ( a_lu(l,k) == 0.0 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DGE_FA - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return;
    end
%
%  Interchange rows L and K if necessary.
%
    if ( l ~= k )
      t         = a_lu(l,k);
      a_lu(l,k) = a_lu(k,k);
      a_lu(k,k) = t;
    end
%
%  Normalize the values that lie below the pivot entry A(K,K).
%
    a_lu(k+1:n,k) = -a_lu(k+1:n,k) / a_lu(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n

      if ( l ~= k )
        t         = a_lu(l,j);
        a_lu(l,j) = a_lu(k,j);
        a_lu(k,j) = t;
      end

      a_lu(k+1:n,j) = a_lu(k+1:n,j) + a_lu(k+1:n,k) * a_lu(k,j);

    end
  end

  pivot(n) = n;

  if ( a_lu(n,n) == 0.0 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DGE_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
    return;
  end

  return
end
