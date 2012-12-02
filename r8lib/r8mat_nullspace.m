function nullspace = r8mat_nullspace ( m, n, a, nullspace_size )

%*****************************************************************************80
%
%% R8MAT_NULLSPACE computes the nullspace of a matrix.
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
%    This routine uses the reduced row echelon form of A to determine
%    a set of NULLSPACE_SIZE independent null vectors.
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
%    Input, integer NULLSPACE_SIZE, the size of the nullspace.
%
%    Output, real NULLSPACE(N,NULLSPACE_SIZE), vectors that span the nullspace.

%
%  Get the reduced row echelon form of A.
%
  a = r8mat_rref ( m, n, a );
%
%  Note in ROW the columns of the leading nonzeros.
%  COL(J) = +J if there is a leading 1 in that column, and -J otherwise.
%
  row = zeros(m,1);

  col(1:n) = - ( 1 : n );

  for i = 1 : m
    for j = 1 : n
      if ( a(i,j) == 1.0 )
        row(i) = j;
        col(j) = j;
        break
      end
    end
  end

  nullspace = zeros(n,nullspace_size);

  j2 = 0;
%
%  If column J does not contain a leading 1, then it contains
%  information about a null vector.
%
  for j = 1 : n

    if ( col(j) < 0 )

      j2 = j2 + 1;

      for i = 1 : m
        if ( a(i,j) ~= 0.0 )
          i2 = row(i);
          nullspace(i2,j2) = - a(i,j);
        end
      end

      nullspace(j,j2) = 1.0;

    end
    
  end

  return
end
