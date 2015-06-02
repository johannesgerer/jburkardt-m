function r = r8mat_pofac ( n, a )

%*****************************************************************************80
%
%% R8MAT_POFAC factors a real symmetric positive definite matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the symmetric matrix
%    to be factored.  Only the diagonal and upper triangle are used.
%
%    Output, real R(N,N), an upper triangular matrix such that
%    A = R'*R.
%
  r(1:n,1:n) = a(1:n,1:n);

  for j = 1 : n - 1
    r(j+1:n,j) = 0.0;
  end

  for j = 1 : n

    s = 0.0;

    for k = 1 : j - 1
      t = r(k,j) - r(1:k-1,k)' * r(1:k-1,j);
      t = t / r(k,k);
      r(k,j) = t;
      s = s + t * t;
    end

    s = r(j,j) - s;

    if ( s < 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8MAT_POFAC - Fatal error!\n' );
      fprintf ( 1, '  The matrix is not positive definite.\n' );
      error ( 'R8MAT_POFAC - Fatal error!' );
    end

    if ( s == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8MAT_POFAC - Warning!\n' );
      fprintf ( 1, '  The matrix is not strictly positive definite.\n' );
    end

    r(j,j) = sqrt ( s )

  end

  return
end