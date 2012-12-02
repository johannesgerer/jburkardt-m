function [ a, seed ] = r8pbu_random ( n, mu, seed )

%*****************************************************************************80
%
%% R8PBU_RANDOM randomizes a R8PBU matrix.
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
%    The matrix returned will be positive definite, but of limited
%    randomness.  The off diagonal elements are random values between
%    0 and 1, and the diagonal element of each row is selected to
%    ensure strict diagonal dominance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer MU, the number of superdiagonals in the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(MU+1,N), the dPBU matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Zero out the "junk" entries.
%
  for j = 1 : mu
    a(1:mu+1-j,j) = 0.0;
  end
%
%  Set the off diagonal values.
%
  for i = 1 : n
    for j = i+1 : min ( i+mu, n )
      [ a(mu+1+i-j,j), seed ] = r8_uniform_01 ( seed );
    end
  end
%
%  Set the diagonal values.
%
  for i = 1 : n

    sum2 = 0.0;

    jlo = max ( 1, i - mu );
    for j = jlo : i-1
      sum2 = sum2 + abs ( a(mu+1+j-i,i) );
    end

    jhi = min ( i + mu, n );
    for j = i+1 : jhi
      sum2 = sum2 + abs ( a(mu+1+i-j,j) );
    end

    [ r, seed ] = r8_uniform_01 ( seed );

    a(mu+1,i) = ( 1.0 + r ) * ( sum2 + 0.01 );

  end

  return
end
