function b = r8ge_mu ( m, n, a_lu, trans, pivot, x )

%*****************************************************************************80
%
%% R8GE_MU computes A * x or A' * x, using R8GE_TRF factors.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    It is assumed that R8GE_TRF has overwritten the original matrix
%    information by PLU factors.  R8GE_MU is able to reconstruct the
%    original matrix from the PLU factor data.
%
%    R8GE_MU allows the user to check that the solution of a linear
%    system is correct, without having to save an unfactored copy
%    of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anderson, Bai, Bischof, Demmel, Dongarra, Du Croz, Greenbaum,
%    Hammarling, McKenney, Ostrouchov, Sorensen,
%    LAPACK User's Guide,
%    Second Edition,
%    SIAM, 1995.
%
%  Parameters:
%
%    Input, integer M, the number of rows in the matrix.
%
%    Input, integer N, the number of columns in the matrix.
%
%    Input, real A_LU(M,N), the LU factors from R8GE_TRF.
%
%    Input, character TRANS, specifies the form of the system of equations:
%    'N':  A * x = b  (No transpose)
%    'T':  A'* X = B  (Transpose)
%    'C':  A'* X = B  (Conjugate transpose = Transpose)
%
%    Input, integer PIVOT(*), the pivot vector computed by R8GE_TRF.
%
%    Input, real X(*), the vector to be multiplied.
%    For the untransposed case, X should have N entries.
%    For the transposed case, X should have M entries.
%
%    Output, real B(*), the result of the multiplication.
%    For the untransposed case, B should have M entries.
%    For the transposed case, B should have N entries.
%
  npiv = min ( m - 1, n );
  mn_max = max ( m, n );

  if ( trans == 'n' | trans == 'N' )
%
%  Y[MN] = U[MNxN] * X[N].
%
    b(1:m) = 0.0;
    y(1:n) = 0.0;

    for j = 1 : n

      for i = 1 : min ( j, m )
        y(i) = y(i) + a_lu(i,j) * x(j);
      end

    end
%
%  Z[M] = L[MxMN] * Y[MN] = L[MxMN] * U[MNxN] * X[N].
%
    for i = 1 : m

      if ( i <= n )
        b(i) = y(i);
      else
        b(i) = 0.0;
      end

    end

    for j = min ( m-1, n ) : -1 : 1
      b(j+1:m) = b(j+1:m) + a_lu(j+1:m,j)' * y(j);
    end
%
%  B = P * Z = P * L * Y = P * L * U * X = A * x.
%
    for j = npiv : -1 : 1

      k = pivot(j);

      if ( k ~= j )
        t    = b(k);
        b(k) = b(j);
        b(j) = t;
      end

    end

  elseif ( trans == 't' | trans == 'T' | trans == 'c' | trans == 'C' )

    b(1:m) = 0.0;
%
%  Y = tranpose(P) * X:
%
    for i = 1 : npiv

      k = pivot(i);

      if ( k ~= i )
        t    = x(k);
        x(k) = x(i);
        x(i) = t;
      end

    end

    for i = 1 : n

      if ( i <= m )
        b(i) = x(i);
      else
        b(i) = 0.0;
      end

    end
%
%  Z = tranpose(L) * Y:
%
    for j = 1 : min ( m - 1, n )
      b(j) = b(j) + sum ( x(j+1:m) * a_lu(j+1:m,j) );
    end
%
%  B = U' * Z.
%
    for i = m : -1 : 1
      b(i+1:n) = b(i+1:n) + b(i) * a_lu(i,i+1:n);
      if ( i <= n )
        b(i) = b(i) * a_lu(i,i);
      end
    end
%
%  Now restore X.
%
    for i = npiv : -1 : 1

      k = pivot(i);

      if ( k ~= i )
        t    = x(k);
        x(k) = x(i);
        x(i) = t;
      end

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8GE_MU - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TRANS = %c\n', trans );
    error ( 'R8GE_MU - Fatal error!' );

  end

  return
end
