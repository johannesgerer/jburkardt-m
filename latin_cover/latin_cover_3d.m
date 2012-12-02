function a = latin_cover_3d ( n, p )

%*****************************************************************************80
%
%% LATIN_COVER_3D returns a 3D Latin Square Covering.
%
%  Discussion:
%
%    A basic solution is computed, and the user is permitted to permute
%    both I, J and K coordinates.
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
%    Input, integer P(3,N), permutations to be applied
%    to the spatial dimensions.
%
%    Output, integer A(N,N,N), the Latin cover.  A(I,J,K) = L
%    means that (I,J,K) is one element of the L-th Latin square.
%
  perm_check ( n, p(1,1:n) );
  perm_check ( n, p(2,1:n) );
  perm_check ( n, p(3,1:n) );
%
%  Set up the basic solution.
%
  a = zeros ( n, n, n );
  b = zeros ( n, n, n );

  for i = 1 : n
    for j = 1 : n
      for k = 1 : n
        ik = i4_wrap ( i + 1 - k, 1, n );
        jk = i4_wrap ( j + 1 - k, 1, n );
        b(i,j,k) = ik + ( jk - 1 ) * n;
      end
    end
  end
%
%  Apply permutation to dimension I.
%
  for i = 1 : n
    a(p(1,i),1:n,1:n) = b(i,1:n,1:n);
  end
%
%  Apply permutation to dimension J.
%
  for j = 1 : n
    b(1:n,p(2,j),1:n) = a(1:n,j,1:n);
  end
%
%  Apply permutation to dimension K.
%
  for k = 1 : n
    a(1:n,1:n,p(3,k)) = b(1:n,1:n,k);
  end

  return
end
