function x = r8plu_sol ( n, pivot, lu, b )

%*****************************************************************************80
%
%% R8PLU_SOL solves a linear system A*x=b from the PLU factors.
%
%  Discussion:
%
%    The PLU factors should have been computed by R8MAT_TO_R8PLU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2006
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
%
%    Input, integer PIVOT(N), the pivot vector from R8MAT_TO_R8PLU.
%
%    Input, real LU(N,N), the LU factors from R8MAT_TO_R8PLU.
%
%    Input, real B(N), the right hand side vector.
%
%    Output, real X(N), the solution vector.
%

%
%  Solve PL * Y = B.
%
  x(1:n) = b(1:n);

  for k = 1 : n-1

    j = pivot(k);

    if ( j ~= k )
      temp = x(j);
      x(j) = x(k);
      x(k) = temp;
    end

    x(k+1:n) = x(k+1:n) + lu(k+1:n,k)' * x(k);

  end
%
%  Solve U * X = Y.
%
  for k = n : -1 : 1
    x(k) = x(k) / lu(k,k);
    x(1:k-1) = x(1:k-1) - lu(1:k-1,k)' * x(k);
  end

  return
end
