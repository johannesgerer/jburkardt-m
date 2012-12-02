function [ a, seed ] = r8pbl_random ( n, mu, seed )

%*****************************************************************************80
%
%% R8PBL_RANDOM randomizes a R8PBL matrix.
%
%  Discussion:
%
%    The R8PBL storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and lower triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row 1 of the array.
%    The first subdiagonal in row 2, columns 1 through MU.
%    The second subdiagonal in row 3, columns 1 through MU-1.
%    The MU-th subdiagonal in row MU+1, columns 1 through 1.
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
%    Input, integer MU, the number of subdiagonals in the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(MU+1,N), the R8PBL matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Zero out the "junk" entries.
%
  for j = n+1-mu : n
    a(2+n-j:mu+1,j) = 0.0;
  end
%
%  Set the off diagonal values.
%
  for i = 1 : n
    for j = max ( 1, i - mu ) : i - 1
      [ a(i-j+1, seed ] = r8_uniform_01 ( seed );
    end
  end
%
%  Set the diagonal values.
%
  for i = 1 : n

    sum2 = 0.0;

    jlo = max ( 1, i - mu );
    for j = jlo : i-1
      sum2 = sum2 + abs ( a(i-j+1,j) );
    end

    jhi = min ( i + mu, n );
    for j = i+1 : jhi
      sum2 = sum2 + abs ( a(j-i+1,i) );
    end

    [ r, seed ] = r8_uniform_01 ( seed );

    a(1,i) = ( 1.0 + r ) * ( sum2 + 0.01 );

  end

  return
end
