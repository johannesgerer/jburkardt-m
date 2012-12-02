function [ a_lu, info ] = r8ge_np_fa ( n, a )

%*****************************************************************************80
%
%% R8GE_NP_FA factors a R8GE matrix by nonpivoting Gaussian elimination.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_NP_FA is a version of the LINPACK routine R8GEFA, but uses no
%    pivoting.  It will fail if the matrix is singular, or if any zero
%    pivot is encountered.
%
%    If R8GE_NP_FA successfully factors the matrix, R8GE_NP_SL may be called
%    to solve linear systems involving the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2004
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
%    Input, real A(N,N), the matrix to be factored.
%
%    Output, real A_LU(N,N), information about the factorization,
%    which must be passed unchanged to R8GE_NP_SL for solutions.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  a_lu(1:n,1:n) = a(1:n,1:n);
  info = 0;

  for k = 1 : n-1

    if ( a_lu(k,k) == 0.0E+00 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8GE_NP_FA - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return
    end

    a_lu(k+1:n,k) = -a_lu(k+1:n,k) ./ a_lu(k,k);
    for j = k+1 : n
      a_lu(k+1:n,j) = a_lu(k+1:n,j) + a_lu(k+1:n,k) .* a_lu(k,j);
    end

  end

  if ( a_lu(n,n) == 0.0E+00 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8GE_NP_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
  end

  return
end
