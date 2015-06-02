function b = r83_mv ( m, n, a, x )

%*****************************************************************************80
%
%% R83_MV multiplies an R83 matrix times an R8VEC.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how an R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(3,N), the R83 matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product A * x.
%
  b = zeros ( m, 1 );

  mn = min ( m, n );

  if ( n == 1 )
    b(1,1) = a(2,1) * x(1,1);
    if ( 1 < m )
      b(2,1) = a(3,1) * x(1,1);
    end
    return
  end

  b(1,1)      = a(2,1)       * x(1,1) ...
              + a(1,2)       * x(2,1);

  b(2:mn-1,1) = a(3,1:mn-2)' .* x(1:mn-2,1) ...
              + a(2,2:mn-1)' .* x(2:mn-1,1) ...
              + a(1,3:mn)'   .* x(3:mn,1);

  b(mn,1)     = a(3,mn-1)    * x(mn-1,1) ...
              + a(2,mn)      * x(mn,1);

  if ( n < m )
    b(mn+1,1) = b(mn+1,1) + a(3,mn) * x(mn,1);
  end

  if ( m < n )
    b(mn,1) = b(mn,1) + a(1,mn+1) * x(mn+1,1);
  end

  return
end
