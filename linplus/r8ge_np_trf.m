function [ a_lu, info ] = r8ge_np_trf ( m, n, a )

%*****************************************************************************80
%
%% R8GE_NP_TRF computes the LU factorization of a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_NP_TRF is a nonpivoting version of R8GE_TRF, and will fail if
%    a zero element is encountered along the diagonal.
%
%    The factorization has the form
%      A = L * U
%    where L is lower triangular with unit diagonal elements (lower
%    trapezoidal if N < M), and U is upper triangular (upper trapezoidal
%    if M < N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix A.  0 <= M.
%
%    Input, integer N, the number of columns of the matrix A.  0 <= N.
%
%    Input, real A(M,N), the matrix to be factored.
%
%    Output, integer INFO.
%    = 0: successful exit
%    < 0: if INFO = -K, the K-th argument had an illegal value
%    > 0: if INFO = K, U(K,K) is exactly zero. The factorization
%         has been completed, but the factor U is exactly
%         singular, and division by zero will occur if it is used
%         to solve a system of equations.
%
%    Output, real A_LU(M,N), the factors L and U from the factorization
%    A = L*U; the unit diagonal elements of L are not stored.
%
  info = 0;
  a_lu(1:m,1:n) = a(1:m,1:n);
%
%  Test the input parameters.
%
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
%  Compute elements J+1:M of the J-th column.
%
    if ( a(j,j) ~= 0.0E+00 )
      a_lu(j+1:m,j) = a_lu(j+1:m,j) / a_lu(j,j);
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
