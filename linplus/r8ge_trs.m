function [ x, info ] = r8ge_trs ( n, nrhs, trans, a_lu, pivot, b )

%*****************************************************************************80
%
%% R8GE_TRS solves a system of linear equations factored by R8GE_TRF.
%
%  Discussion:
%
%    Note that in MATLAB we will have peculiar and maddening problems
%    if our input data B is actually a vector; in fact, if B is a vector,
%    we must do something like call R8VEC_TO_R8GE in order to make it
%    look like a 2D array to MATLAB.
%
%    The R8GE storage format is used for a general M by N matrix.  A storage
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_TRS is a standalone version of the LAPACK routine R8GETRS.
%
%    R8GE_TRS solves a system of linear equations
%      A * x = b  or  A' * X = B
%    with a general N by N matrix A using the PLU factorization computed
%    by R8GE_TRF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
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
%    Input, real A_LU(N,N), the LU factors from R8GE_TRF.
%
%    Input, integer PIVOT(N), the pivot indices from R8GE_TRF.
%
%    Input, real B(N,NRHS), the right hand side matrix B.
%
%    Output, real X(N,NRHS), the solution matrix X.
%
%    Output, integer INFO
%    = 0:  successful exit
%    < 0:  if INFO = -I, the I-th argument had an illegal value.
%
  x(1:n,1:nrhs) = b(1:n,1:nrhs);

  info = 0;

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
%  Apply row interchanges to the right hand sides.
%
    for i = 1 : n
      if ( pivot(i) ~= i )
        for k = 1 : nrhs
          t             = x(i,k)
          x(i,k)        = x(pivot(i),k);
          x(pivot(i),k) = t;
        end
      end
    end
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
%
%  Apply row interchanges to the solution vectors.
%
    for i = n : -1 : 1
      if ( pivot(i) ~= i )
        for k = 1 : nrhs
          t            = x(i,k);
          x(i,k)        = x(pivot(i),k);
          x(pivot(i),k) = t;
        end
      end
    end

  end

  return
end
