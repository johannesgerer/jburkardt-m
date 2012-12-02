function [ a_lu, info ] = r8pbu_fa ( n, mu, a )

%*****************************************************************************80
%
%% R8PBU_FA factors a R8PBU matrix.
%
%  Discussion:
%
%    The R8PBU storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and upper triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%    The matrix A must be a positive definite symmetric band matrix.
%
%    Once factored, linear systems A*x=b involving the matrix can be solved
%    by calling R8PBU_SL.  No pivoting is performed.  Pivoting is not necessary
%    for positive definite symmetric matrices.  If the matrix is not positive
%    definite, the algorithm may behave correctly, but it is also possible
%    that an illegal divide by zero will occur.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 1998
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, Philadelphia, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer MU, the number of superdiagonals of the matrix.
%    MU must be at least 0, and no more than N-1.
%
%    Input, real A(MU+1,N), the N by N matrix, stored in LINPACK
%    positive definite symmetric band matrix storage.
%
%    Output, real A_LU(MU+1,N), information describing a factored form
%    of the matrix, that can be used to solve linear systems
%    A*x=b, using R8PBU_SL.
%
%    Output, integer INFO, singularity flag.
%    0, the matrix is nonsingular.
%    nonzero, the matrix is singular.
%
  info = 0;
  a_lu(1:mu+1,1:n) = a(1:mu+1,1:n);

  for j = 1 : n

    ik = mu + 1;
    jk = max ( j - mu, 1 );
    mm = max ( mu + 2 - j, 1 );

    s = 0.0;

    for k = mm : mu

      a_lu(k,j) = ( a_lu(k,j) - a_lu(ik:ik+k-mm-1,jk)' * a_lu(mm:k-1,j) )...
        / a_lu(mu+1,jk);

      s = s + a_lu(k,j) * a_lu(k,j);

      ik = ik - 1;
      jk = jk + 1;

    end

    s = a_lu(mu+1,j) - s;

    if ( s <= 0.0 )
      info = j;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8PBU_FA - Fatal error!\n' );
      fprintf ( 1, '  Nonpositive pivot on step %d\n', info );
      return;
    end

    a_lu(mu+1,j) = sqrt ( s );

  end

  return
end
