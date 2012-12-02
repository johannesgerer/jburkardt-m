function p = perm_mat_to_vec ( n, a )

%*****************************************************************************80
%
%% PERM_MAT_TO_VEC returns a permutation from a permutation matrix.
%
%  Example:
%
%    N = 5
%
%    A = 0  1  0  0  0
%        0  0  0  1  0
%        1  0  0  0  0
%        0  0  1  0  0
%        0  0  0  0  1
%
%    p = ( 2, 4, 1, 3, 5 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), the permutation matrix.
%
%    Output, integer P(N), a permutation of the indices 1 through 
%    N, which corresponds to the matrix.
%
  ival = r8mat_is_perm ( n, a );

  if ( ival ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_MAT_TO_VEC - Fatal error!\n' );
    fprintf ( 1, '  The input matrix does not define a permutation.\n' );
    fprintf ( 1, '  R8MAT_IS_PERM returned IVAL = %d\n', ival );
    error ( 'PERM_MAT_TO_VEC - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n
      if ( a(i,j) == 1.0 )
        p(i) = j;
      end
    end
  end

  return
end
