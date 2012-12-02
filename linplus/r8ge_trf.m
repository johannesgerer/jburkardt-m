function [ a_lu, pivot, info ] = r8ge_trf ( m, n, a )

%*****************************************************************************80
%
%% R8GE_TRF performs a LAPACK-style PLU factorization of a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_TRF is a standalone version of the LAPACK routine R8GETRF.
%
%    The factorization uses partial pivoting with row interchanges,
%    and has the form
%      A = P * L * U
%    where P is a permutation matrix, L is lower triangular with unit
%    diagonal elements (lower trapezoidal if N < M), and U is upper
%    triangular (upper trapezoidal if M < N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
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
%    Input, integer M, the number of rows of the matrix A.  0 <= M.
%
%    Input, integer N, the number of columns of the matrix A.  0 <= N.
%
%    Input, real A(M,N), the M by N matrix to be factored.
%
%    Output, real A_LU(M,N), the factors L and U from the factorization
%    A = P*L*U; the unit diagonal elements of L are not stored.
%
%    Output, integer PIVOT(min(M,N)), the pivot indices;
%    for 1 <= I <= min(M,N), row i of the matrix was interchanged with
%    row PIVOT(I).
%
%    Output, integer INFO.
%    = 0: successful exit
%    < 0: if INFO = -K, the K-th argument had an illegal value
%    > 0: if INFO = K, U(K,K) is exactly zero. The factorization
%         has been completed, but the factor U is exactly
%         singular, and division by zero will occur if it is used
%         to solve a system of equations.
%
  a_lu(1:m,1:n) = a(1:m,1:n);
%
%  Test the input parameters.
%
  info = 0;

  if ( m < 0 )
    info = -1;
    return
  elseif ( n < 0 )
    info = -2;
    return
  end

  if ( m == 0 | n == 0 )
    return
  end

  for j = 1 : min ( m, n )
%
%  Find the pivot.
%
    temp = abs ( a_lu(j,j) );
    jp = j;
    for i = j+1 : m
      if ( temp < abs ( a_lu(i,j) ) )
        temp = abs ( a_lu(i,j) );
        jp = i;
      end
    end

    pivot(j) = jp;
%
%  Apply the interchange to columns 1:N.
%  Compute elements J+1:M of the J-th column.
%
    if ( a_lu(jp,j) ~= 0.0E+00 )

      if ( jp ~= j )
        for jj = 1 : n
          t           = a_lu(j,jj);
          a_lu(j,jj)  = a_lu(jp,jj);
          a_lu(jp,jj) = t;
        end
      end

      if ( j < m )
        a_lu(j+1:m,j) = a_lu(j+1:m,j) / a_lu(j,j);
      end

    elseif ( info == 0 )

      info = j;

    end
%
%  Update the trailing submatrix.
%
    if ( j < min ( m, n ) )

      for ii = j+1 : m
        a_lu(ii,j+1:n) = a_lu(ii,j+1:n) - a_lu(ii,j) * a_lu(j,j+1:n);
      end

    end

  end

  return
end
