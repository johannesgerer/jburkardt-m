function [ a, seed ] = i4mat_perm2_uniform ( m, n, a, seed )

%*****************************************************************************80
%
%% I4MAT_PERM2_UNIFORM selects a random permutation of an I4MAT.
%
%  Discussion:
%
%    The matrix may be rectangular.  Separate permutations are
%    applied to the rows and columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis, H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), the array to be permuted.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(M,N), the permuted array.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Permute the rows.
%
  for i = 1 : m

    [ i2, seed ] = i4_uniform_ab ( i, m, seed );

    temp(1,1:n) = a(i2,1:n);
    a(i2,1:n) = a(i,1:n);
    a(i,1:n) = temp(1,1:n);

  end
%
%  Permute the columns.
%
  for j = 1 : n

    [ j2, seed ] = i4_uniform_ab ( j, n, seed );

    temp(1:m,1) = a(1:m,j2);
    a(1:m,j2) = a(1:m,j);
    a(1:m,j) = temp(1:m,1);

  end

  return
end
