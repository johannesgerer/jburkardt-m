function [ x, info ] = r8ge_np_trs ( n, nrhs, trans, a_lu, b )

%*****************************************************************************80
%
%% R8GE_NP_TRS solves a system of linear equations factored by R8GE_NP_TRF.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_NP_TRS is a nonpivoting version of R8GE_TRS.
%
%    R8GE_TRS solves a system of linear equations
%      A * x = b  or  A' * X = B
%    with a general N by N matrix A using the LU factorization computed
%    by R8GE_NP_TRF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anderson, Bai, Bischof, Demmel, Dongarra, Du Croz, Greenbaum,
%    Hammarling, McKenney, Ostrouchov, Sorensen,
%    LAPACK User's Guide,
%    Second Edition,
%    SIAM, 1995.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.  0 <= N.
%
%    Input, integer NRHS, the number of right hand sides.  0 <= NRHS.
%
%    Input, character TRANS, specifies the form of the system of equations:
%    'N':  A * x = b  (No transpose)
%    'T':  A'* X = B  (Transpose)
%    'C':  A'* X = B  (Conjugate transpose = Transpose)
%
%    Input, real A_LU(N,N), the LU factors from R8GE_NP_TRF.
%
%    Input, real B(N,NRHS), the right hand side matrix B.
%
%    Output, real X(N,NRHS), the solution matrix X.
%
%    Output, integer INFO
%    = 0:  successful exit
%    < 0:  if INFO = -I, the I-th argument had an illegal value.
%
  info = 0;
  x(1:n,1:nrhs) = b(1:n,1:nrhs);

  if ( trans ~= 'n' & trans ~= 'N' & trans ~= 't' & trans ~= 'T' & ...
       trans ~= 'c' & trans ~= 'C' )
    info = -1;
    return
  elseif ( n < 0 )
    info = -2;
    return
  elseif ( nrhs < 0 )
    info = -3;
    return
  end

  if ( n == 0 | nrhs == 0 )
    return
  end

  if ( trans == 'n' | trans == 'N' )
%
%  Solve L * x = b, overwriting b with x.
%
    for k = 1 : nrhs
      for j = 1 : n - 1
        x(j+1:n,k) = x(j+1:n,k) - a_lu(j+1:n,j) * x(j,k);
      end
    end
%
%  Solve U * x = b, overwriting b with x.
%
    for k = 1 : nrhs
      for j = n : -1 : 1
        x(j,k) = x(j,k) / a_lu(j,j);
        x(1:j-1,k) = x(1:j-1,k) - a_lu(1:j-1,j) * x(j,k);
      end
    end

  else
%
%  Solve U' * x = b, overwriting b with x.
%
    for k = 1 : nrhs
      for j = 1 : n
        x(j,k) = x(j,k) / a_lu(j,j);
        x(j+1:n,k) = x(j+1:n,k) - a_lu(j,j+1:n)' * x(j,k);
      end
    end
%
%  Solve L' * x = b, overwriting b with x.
%
    for k = 1 : nrhs
      for j = n : -1 : 2
        x(1:j-1,k) = x(1:j-1,k) - a_lu(j,1:j-1)' * x(j,k);
      end
    end

  end

  return
end
