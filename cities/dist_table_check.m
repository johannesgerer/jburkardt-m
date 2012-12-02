function check = dist_table_check ( n, dist_table )

%*****************************************************************************80
%
%% DIST_TABLE_CHECK checks a distance table.
%
%  Discussion:
%
%    1) All entries must be nonnegative.
%    2) Diagonal entries must be zero.
%    3) Off-diagonal entries must be symmetric.
%    4) The triangle inequality must be observed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of cities.
%
%    Input, real DIST_TABLE(N,N), the distance table.
%
%    Output, integer CHECK, the result of the check.
%    0, the matrix passed the checks.
%    1, Not all entries are nonnegative.
%    2, Not all diagonal entries are zero.
%    3, Not all off-diagonal entries are symmetric.
%    4, Not all entries satisfy the triangle inequality.
%
  if ( any ( dist_table(1:n,1:n) < 0.0 ) )
    check = 1;
    return
  end

  for i = 1 : n
    if ( dist_table(i,i) ~= 0.0 )
      check = 2;
      return
    end
  end

  for i = 1 : n
    for j = 1 : i - 1
      if ( dist_table(i,j) ~= dist_table(j,i) )
        check = 3;
        return
      end
    end
  end

  for i = 1 : n
    for j = 1 : n
      for k = 1 : n
        if ( dist_table(i,j) + dist_table(j,k) < dist_table(i,k) )
          check = 4;
          return
        end
      end
    end
  end

  check = 0;

  return
end
