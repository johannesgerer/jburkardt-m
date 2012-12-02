function det = dge_det ( n, a )

%*****************************************************************************80
%
%% DGE_DET computes the determinant of a square matrix in DGE storage.
%
%  Discussion:
%
%    The DGE storage format is used for a general M by N matrix.  A storage
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2004
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
%    Input, real A(N,N), the matrix to be analyzed.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;

  for k = 1 : n-1
%
%  Find L, the index of the pivot row.
%
    l = k;
    for i = k+1 : n
      if ( abs ( a(l,k) ) < abs ( a(i,k) ) )
        l = i;
      end
    end

    det = det * a(l,k);
%
%  Interchange rows L and K if necessary.
%
    if ( l ~= k )
      t      = a(l,k);
      a(l,k) = a(k,k);
      a(k,k) = t;
    end
%
%  Normalize the values that lie below the pivot entry A(K,K).
%
    a(k+1:n,k) = -a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n

      if ( l ~= k )
        t      = a(l,j);
        a(l,j) = a(k,j);
        a(k,j) = t;
      end

      a(k+1:n,j) = a(k+1:n,j) + a(k+1:n,k) * a(k,j);

    end

  end

  det = det * a(n,n);

  return
end
