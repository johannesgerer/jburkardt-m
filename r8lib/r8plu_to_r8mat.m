function a = r8plu_to_r8mat ( n, pivot, lu )

%*****************************************************************************80
%
%% R8PLU_TO_R8MAT recovers the matrix A that was factored by R8MAT_TO_R8PLU.
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
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer PIVOT(N), the pivot vector computed by R8MAT_TO_R8PLU.
%
%    Input, real LU(N,N), the matrix factors computed by
%    R8MAT_TO_R8PLU.
%
%    Output, real A(N,N), the matrix whose factors are
%    represented by LU and PIVOT.
%
  a(1:n,1:n) = 0.0;
  for i = 1 : n
    a(i,i) = 1.0;
  end

  for j = 1 : n

    for i = 1 : n
      a(1:i-1,j) = a(1:i-1,j) + lu(1:i-1,i) * a(i,j);
      a(i,j) = lu(i,i) * a(i,j);
    end
%
%  B = PL * Y = PL * U * X = A * x.
%
    for i = n-1 : -1 : 1

      a(i+1:n,j) = a(i+1:n,j) - lu(i+1:n,i) * a(i,j);

      k = pivot(i);

      if ( k ~= i )
        temp   = a(k,j);
        a(k,j) = a(i,j);
        a(i,j) = temp;
      end

    end

  end

  return
end
