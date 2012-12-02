function a = r8vec_permute_cyclic ( n, k, a )

%*****************************************************************************80
%
%% R8VEC_PERMUTE_CYCLIC performs a cyclic permutation of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    For 0 <= K < N, this function cyclically permutes the input vector
%    to have the form
%
%     ( A(K+1), A(K+2), ..., A(N), A(1), ..., A(K) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, integer K, the increment used.
%
%    Input/output, real A(N), the array to be permuted.
%
  b = zeros ( size ( a ) );

  for i = 1 : n
    ipk = i4_wrap ( i + k, 1, n );
    b(i) = a(ipk);
  end

  a(1:n) = b(1:n);

  return
end
