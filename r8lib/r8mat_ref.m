function a = r8mat_ref ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_REF computes the row echelon form of a matrix.
%
%  Discussion:
%
%    A matrix is in row echelon form if:
%
%    * The first nonzero entry in each row is 1.
%
%    * The leading 1 in a given row occurs in a column to
%      the right of the leading 1 in the previous row.
%
%    * Rows which are entirely zero must occur last.
%
%  Example:
%
%    Input matrix:
%
%     1.0  3.0  0.0  2.0  6.0  3.0  1.0
%    -2.0 -6.0  0.0 -2.0 -8.0  3.0  1.0
%     3.0  9.0  0.0  0.0  6.0  6.0  2.0
%    -1.0 -3.0  0.0  1.0  0.0  9.0  3.0
%
%    Output matrix:
%
%     1.0  3.0  0.0  2.0  6.0  3.0  1.0
%     0.0  0.0  0.0  1.0  2.0  4.5  1.5
%     0.0  0.0  0.0  0.0  0.0  1.0  0.3
%     0.0  0.0  0.0  0.0  0.0  0.0  0.0
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
%    Output, real A(M,N), the REF form of the matrix.
%
  lead = 1;

  for r = 1 : m

    if ( n < lead )
      break
    end

    i = r;

    while ( a(i,lead) == 0.0 )

      i = i + 1;

      if ( m < i )
        i = r;
        lead = lead + 1;
        if ( n < lead )
          lead = -1;
          break
        end
      end

    end

    if ( lead < 0 )
      break
    end

    temp     = a(i,1:n);
    a(i,1:n) = a(r,1:n);
    a(r,1:n) = temp;

    a(r,1:n) = a(r,1:n) / a(r,lead);

    for i = r + 1 : m
      a(i,1:n) = a(i,1:n) - a(i,lead) * a(r,1:n);
    end

    lead = lead + 1;

  end

  return
end
