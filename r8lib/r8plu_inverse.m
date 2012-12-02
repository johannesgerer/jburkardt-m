function a_inverse = r8plu_inverse ( n, pivot, lu )

%*****************************************************************************80
%
%% R8PLU_INVERSE computes the inverse of an R8PLU matrix.
%
%  Discussion:
%
%    The matrix should have been factored by R8MAT_TO_R8PLU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
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
%    Input, integer N, the order of the matrix A.
%
%    Input, integer PIVOT(N), the pivot vector from R8MAT_TO_R8PLU.
%
%    Input, real LU(N,N), the LU factors computed by R8MAT_TO_R8PLU.
%
%    Output, real A_INVERSE(N,N), the inverse of the original
%    matrix A that was factored by R8MAT_TO_R8PLU.
%
  a_inverse(1:n,1:n) = lu(1:n,1:n);
%
%  Compute Inverse(U).
%
  for k = 1 : n

    a_inverse(k,k)     = 1.0 / a_inverse(k,k);
    a_inverse(1:k-1,k) = -a_inverse(1:k-1,k) * a_inverse(k,k);

    for j = k + 1 : n

      temp             = a_inverse(k,j);
      a_inverse(k,j)   = 0.0;
      a_inverse(1:k,j) = a_inverse(1:k,j) + temp * a_inverse(1:k,k);

    end

  end
%
%  Form Inverse(U) * Inverse(L).
%
  for k = n - 1 : -1 : 1

    work(k+1:n) = a_inverse(k+1:n,k);
    a_inverse(k+1:n,k) = 0.0;

    for j = k + 1 : n
      a_inverse(1:n,k) = a_inverse(1:n,k) + a_inverse(1:n,j) * work(j);
    end

    if ( pivot(k) ~= k )

      for i = 1 : n
        temp                  = a_inverse(i,k);
        a_inverse(i,k)        = a_inverse(i,pivot(k));
        a_inverse(i,pivot(k)) = temp;
      end

    end

  end

  return
end
