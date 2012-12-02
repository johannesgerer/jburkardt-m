function b = r8ge_ml ( n, a_lu, pivot, x, job )

%*****************************************************************************80
%
%% R8GE_ML computes A * x or A' * x, using R8GE_FA factors.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    It is assumed that R8GE_FA has overwritten the original matrix
%    information by LU factors.  R8GE_ML is able to reconstruct the
%    original matrix from the LU factor data.
%
%    R8GE_ML allows the user to check that the solution of a linear
%    system is correct, without having to save an unfactored copy
%    of the matrix.
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
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A_LU(N,N), the LU factors from R8GE_FA.
%
%    Input, integer PIVOT(N), the pivot vector computed by R8GE_FA.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Input, integer JOB, specifies the operation to be done:
%    JOB = 0, compute A * x.
%    JOB nonzero, compute A' * X.
%
%    Output, real B(N), the result of the multiplication.
%
  b(1:n) = x(1:n);

  if ( job == 0 )
%
%  Y = U * X.
%
    for j = 1 : n
      b(1:j-1) = b(1:j-1) + a_lu(1:j-1,j)' * b(j);
      b(j) = a_lu(j,j) * b(j);
    end
%
%  B = PL * Y = PL * U * X = A * x.
%
    for j = n-1 : -1 : 1

      b(j+1:n) = b(j+1:n) - a_lu(j+1:n,j)' * b(j);
      k = pivot(j);

      if ( k ~= j )
        t    = b(k);
        b(k) = b(j);
        b(j) = t;
      end

    end

  else
%
%  Y = (PL)' * X:
%
    for j = 1 : n-1

      k = pivot(j);

      if ( k ~= j )
        t    = b(k);
        b(k) = b(j);
        b(j) = t;
      end

      b(j) = b(j) - sum ( b(j+1:n) * a_lu(j+1:n,j) );

    end
%
%  B = U' * Y = ( PL * U )' * X = A' * X.
%
    for i = n : -1 : 1
      b(i+1:n) = b(i+1:n) + b(i) * a_lu(i,i+1:n);
      b(i) = b(i) * a_lu(i,i);
    end

  end

  return
end
