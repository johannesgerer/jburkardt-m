function [ a, seed ] = i4mat_perm_uniform ( n, a, seed )

%*****************************************************************************80
%
%% I4MAT_PERM_UNIFORM selects a random permutation of an I4MAT.
%
%  Discussion:
%
%    The matrix is assumed to be square.  A single permutation is
%    applied to both rows and columns.
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
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns in the array.
%
%    Input, integer A(N,N), the array to be permuted.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(N,N), the permuted array.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Permute the rows and columns together.
%
  for i = 1 : n

    [ i2, seed ] = i4_uniform ( i, n, seed );

    temp(1,1:n) = a(i2,1:n);
    a(i2,1:n) = a(i,1:n);
    a(i,1:n) = temp(1,1:n);

    temp(1:n,1) = a(1:n,i2);
    a(1:n,i2) = a(1:n,i);
    a(1:n,i) = temp(1:n,1);

  end

  return
end
