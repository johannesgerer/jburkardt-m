function b = r8ge_np_inverse ( n, a_lu )

%*****************************************************************************80
%
%% R8GE_NP_INVERSE computes the inverse of a matrix factored by R8GE_NP_FA.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A_LU(N,N), the factor information computed by R8GE_NP_FA.
%
%    Output, real B(N,N), the inverse matrix.
%
  b(1:n,1:n) = a_lu(1:n,1:n);
%
%  Compute Inverse(U).
%
  for k = 1 : n

    b(k,k) = 1.0E+00 / b(k,k);
    b(1:k-1,k) = -b(1:k-1,k) * b(k,k);

    for j = k + 1 : n

      temp = b(k,j);
      b(k,j) = 0.0E+00;
      b(1:k,j) = b(1:k,j) + temp * b(1:k,k);

    end

  end
%
%  Form Inverse(U) * Inverse(L).
%
  for k = n - 1 : -1 : 1

    work(k+1:n) = b(k+1:n,k);
    b(k+1:n,k) = 0.0E+00;

    for j = k + 1 : n
      b(1:n,k) = b(1:n,k) + b(1:n,j) * work(j);
    end

  end

  return
end
