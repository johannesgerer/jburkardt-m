function a_inverse = r8ge_inverse ( n, a_lu, pivot )

%*****************************************************************************80
%
%% R8GE_INVERSE computes the inverse of a matrix factored by R8GE_FA.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_INVERSE is a simplified standalone version of the LINPACK routine
%    R8GEDI.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A_LU(N,N), the factor information computed by R8GE_FA.
%
%    Input, integer PIVOT(N), the pivot vector from R8GE_FA.
%
%    Output, real A_INVERSE(N,N), the inverse matrix.
%
  a_inverse(1:n,1:n) = a_lu(1:n,1:n);
%
%  Compute Inverse(U).
%
  for k = 1 : n

    a_inverse(k,k) = 1.0E+00 / a_inverse(k,k);
    a_inverse(1:k-1,k) = -a_inverse(1:k-1,k) * a_inverse(k,k);

    for j = k + 1 : n

      temp = a_inverse(k,j);
      a_inverse(k,j) = 0.0E+00;
      a_inverse(1:k,j) = a_inverse(1:k,j) + a_inverse(1:k,k) * temp;

    end

  end
%
%  Form Inverse(U) * Inverse(L).
%
  for k = n - 1 : -1 : 1

    work(k+1:n) = a_inverse(k+1:n,k);
    a_inverse(k+1:n,k) = 0.0E+00;

    for j = k + 1 : n
      a_inverse(1:n,k) = a_inverse(1:n,k) + a_inverse(1:n,j) * work(j);
    end

    if ( pivot(k) ~= k )

      for i = 1 : n
        t                     = a_inverse(i,k);
        a_inverse(i,k)        = a_inverse(i,pivot(k));
        a_inverse(i,pivot(k)) = t;
      end

    end

  end

  return
end
