function w = i4vec_min_mv ( m, n, u, v )

%*****************************************************************************80
%
%% I4VEC_MIN_MV determines U(1:N) /\ V for vectors U and a single vector V.
%
%  Discussion:
%
%    For two vectors U and V, each of length M, we define
%
%      ( U /\ V ) (I) = min ( U(I), V(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the vectors.
%
%    Input, integer N, the number of vectors in U.
%
%    Input, integer U(M,N), N vectors, each of length M.
%
%    Input, integer V(M), a vector of length M.
%
%    Output, integer W(M,N), the value of U /\ W.
%
  w(1:m,1:n) = u(1:m,1:n);

  for j = 1 : n
    for i = 1 : m
      w(i,j) = min ( w(i,j), v(i) );
    end
  end

  return
end
