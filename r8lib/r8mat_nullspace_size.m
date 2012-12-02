function nullspace_size = r8mat_nullspace_size ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NULLSPACE_SIZE computes the size of the nullspace of a matrix.
%
%  Discussion:
%
%    Let A be an MxN matrix.
%
%    If X is an N-vector, and A*X = 0, then X is a null vector of A.
%
%    The set of all null vectors of A is called the nullspace of A.
%
%    The 0 vector is always in the null space.
%
%    If the 0 vector is the only vector in the nullspace of A, then A
%    is said to have maximum column rank.  (Because A*X=0 can be regarded
%    as a linear combination of the columns of A).  In particular, if A
%    is square, and has maximum column rank, it is nonsingular.
%
%    The dimension of the nullspace is the number of linearly independent
%    vectors that span the nullspace.  If A has maximum column rank,
%    its nullspace has dimension 0.  
%
%    This routine ESTIMATES the dimension of the nullspace.  Cases of
%    singularity that depend on exact arithmetic will probably be missed.
%
%    The nullspace will be estimated by counting the leading 1's in the
%    reduced row echelon form of A, and subtracting this from N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of
%    the matrix A.
%
%    Input, real A(M,N), the matrix to be analyzed. 
%
%    Output, integer NULLSPACE_SIZE, the estimated size of the nullspace.
%

%
%  Get the reduced row echelon form of A.
%
  a = r8mat_rref ( m, n, a );
%
%  Count the leading 1's in A.
%
  leading = 0;
  for i = 1 : m
    for j = 1 : n
      if ( a(i,j) == 1.0 )
        leading = leading + 1;
        break
      end
    end
  end

  nullspace_size = n - leading;

  return
end
