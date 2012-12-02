function [ a_lu, pivot, info ] = r8ge_fa ( a, n )

%*****************************************************************************80
%
%% R8GE_FA factors a general matrix.
%
%  Discussion:
%
%    R8GE_FA is a simplified version of the LINPACK routine DGEFA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real A(LDA,N), the matrix to be factored.
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Output, real A_LU(LDA,N), contains an upper 
%    triangular matrix and the multipliers which were used to obtain 
%    it.  The factorization can be written A = L * U, where L is a 
%    product of permutation and unit lower triangular matrices and 
%    U is upper triangular.
%
%    Output, integer PIVOT(N), a vector of pivot indices.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  info = 0;
  a_lu(1:n,1:n) = a(1:n,1:n);

  for k = 1 : n-1
%
%  Find L, the index of the pivot row.
%
    l = k;
    for i = k+1 : n
      if ( abs ( a_lu(l,k) ) < abs ( a_lu(i,k) ) )
        l = i;
      end
    end

    pivot(k) = l;
%
%  If the pivot index is zero, the algorithm has failed.
%
    if ( a_lu(l,k) == 0.0E+00 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8GE_FA - Warning!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return
    end
%
%  Interchange rows L and K if necessary.
%
    if ( l ~= k )
      [ a_lu(l,k), a_lu(k,k) ] = r8_swap ( a_lu(l,k), a_lu(k,k) );
    end
%
%  Normalize the values that lie below the pivot entry A(K,K).
%
    a_lu(k+1:n,k) = -a_lu(k+1:n,k) / a_lu(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n

      if ( l ~= k )
        [ a_lu(l,j), a_lu(k,j) ] = r8_swap ( a_lu(l,j), a_lu(k,j) );
      end

      a_lu(k+1:n,j) = a_lu(k+1:n,j) + a_lu(k+1:n,k) * a_lu(k,j);

    end

  end

  pivot(n) = n;

  if ( a_lu(n,n) == 0.0E+00 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8GE_FA - Warning!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
    return
  end

  return
end
