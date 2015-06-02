function b = r83t_mv ( m, n, a, x )

%*****************************************************************************80
%
%% R83T_MV multiplies an R83T matrix times an R8VEC.
%
%  Discussion:
%
%    The R83T storage format is used for a tridiagonal matrix.
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
%    Input, real A(M,3), the matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product A * x.
%
  b = zeros ( m, 1 );
  x = x(:);

  mn = min ( m, n );

  if ( n == 1 )
    b(1) = a(1,2) * x(1);
    if ( 1 < m )
      b(2) = a(2,1) * x(1);
    end
    return
  end

  b(1)      = a(1,2)       * x(1) ...
            + a(1,3)       * x(2);

  b(2:mn-1) = a(2:mn-1,1) .* x(1:mn-2) ...
            + a(2:mn-1,2) .* x(2:mn-1) ...
            + a(2:mn-1,3) .* x(3:mn);

  b(mn)     = a(mn,1)      * x(mn-1) ...
            + a(mn,2)      * x(mn);

  if ( n < m )
    b(mn+1) = b(mn+1) + a(mn+1,1) * x(mn);
  elseif ( m < n )
    b(mn) = b(mn) + a(mn,3) * x(mn+1);
  end

  return
end
