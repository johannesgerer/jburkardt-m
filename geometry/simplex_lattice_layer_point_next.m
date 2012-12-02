function [ v, more ] = simplex_lattice_layer_point_next ( n, c, v, more )

%*****************************************************************************80
%
%% SIMPLEX_LATTICE_LAYER_POINT_NEXT: next simplex lattice layer point.
%
%  Discussion:
%
%    The simplex lattice layer L is bounded by the lines
%
%      0 <= X(1:N),
%      L - 1 < sum X(1:N) / C(1:N)  <= L.
%
%    In particular, layer L = 0 always contains just the origin.
%
%    This function returns, one at a time, the points that lie within 
%    a given simplex lattice layer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, integer C(N+1), coefficients defining the 
%    lattice layer in entries 1 to N, and the laver index in C(N+1).  
%    The coefficients should be positive, and C(N+1) must be nonnegative.
%
%    Input/output, integer V(N).  On first call for a given layer,
%    the input value of V is not important.  On a repeated call for the same
%    layer, the input value of V should be the output value from the previous 
%    call.  On output, V contains the next lattice layer point.
%
%    Input/output, logical MORE.  On input, set MORE to FALSE to indicate
%    that this is the first call for a given layer.  Thereafter, the input
%    value should be the output value from the previous call.  On output,
%    MORE is TRUE if the returned value V is a new point.
%    If the output value is FALSE, then no more points were found,
%    and V was reset to 0, and the lattice layer has been exhausted.
%

%
%  Treat layer C(N+1) = 0 specially.
%
  if ( c(n+1) == 0 )
    if ( ~more )
      v(1:n) = 0;
      more = 1;
    else
      more = 0;
    end
    return
  end
%
%  Compute the first point.
%
  if ( ~more )

    v(1) = ( c(n+1) - 1 ) * c(1) + 1;
    v(2:n) = 0;
    more = 1;

  else

    c1n = i4vec_lcm ( n, c );

    rhs1 = c1n * ( c(n+1) - 1 );
    rhs2 = c1n *   c(n+1);
%
%  Try to increment component I.
%
    for i = 1 : n

      v(i) = v(i) + 1;

      v(1:i-1) = 0;

      if ( 1 < i )
        v(1) = rhs1;
        for j = 2 : n
          v(1) = v(1) - ( c1n / c(j) ) * v(j);
        end
        v(1) = floor ( ( c(1) * v(1) ) / c1n );
        v(1) = max ( v(1), 0 );
      end

      lhs = 0;
      for j = 1 : n
        lhs = lhs + ( c1n / c(j) ) * v(j);
      end

      if ( lhs <= rhs1 )
        v(1) = v(1) + 1;
        lhs = lhs + c1n / c(1);
      end

      if ( lhs <= rhs2 )
        return
      end

    end

    v(1:n) = 0;
    more = 0;

  end

  return
end
