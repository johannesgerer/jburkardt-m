function wtime = floyd_test03_sub ( n )

%*****************************************************************************80
%
%% FLOYD_TEST03_SUB tests I4MAT_FLOYD.
%
%  Discussion:
%
%    The matrix size is input by the user.
%
%    The matrix A has the property that
%
%      A(I,J) = 1 if I is divisible by J.
%
%  Example:
%
%    N = 6
%
%    1 0 0 0 0 0
%    1 1 0 0 0 0
%    1 0 1 0 0 0
%    1 1 0 1 0 0
%    1 0 0 0 1 0
%    1 1 1 0 0 1
%    
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the matrix.
%
%    Output, real WTIME, the wall clock time required by I4MAT_FLOYD.
%
  v = 1 : n;

  a = repmat ( v, n, 1 );

  a = mod ( a', a );
 
  a = ( a == 0 );
%
%  Replace "0" by "Inf".
%
  index = find ( a(1:n,1:n) == 0 );
  a(index) = Inf;

  tic;

  a = i4mat_floyd ( n, a );

  wtime = toc;

  return
end
