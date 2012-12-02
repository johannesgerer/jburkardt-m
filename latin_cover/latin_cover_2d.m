function a = latin_cover_2d ( n, p )

%*****************************************************************************80
%
%% LATIN_COVER_2D returns a 2D Latin Square Covering.
%
%  Discussion:
%
%    This procedure has a chance of being extended to M dimensions.
%
%    A basic solution is computed, and the user is permitted to permute
%    both the I and J coordinates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer P(2,N), permutations to be applied
%    to the spatial dimensions.
%
%    Output, integer A(N,N), the Latin cover.  A(I,J) = K
%    means that (I,J) is one element of the K-th Latin square.
%
  perm_check ( n, p(1,1:n) );
  perm_check ( n, p(2,1:n) );
%
%  Set up the basic solution.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = i4_wrap ( i - j + 1, 1, n );
    end
  end
%
%  Apply permutation to dimension I.
%
  for i = 1 : n
    b(p(1,i),1:n) = a(i,1:n);
  end
%
%  Apply permutation to dimension J.
%
  for j = 1 : n
    a(1:n,p(2,j)) = b(1:n,j);
  end

  return
end
