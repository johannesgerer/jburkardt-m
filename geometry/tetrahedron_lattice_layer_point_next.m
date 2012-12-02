function [ v, more ] = tetrahedron_lattice_layer_point_next ( c, v, more )

%*****************************************************************************80
%
%% TETRAHEDRON_LATTICE_LAYER_POINT_NEXT: next tetrahedron lattice layer point.
%
%  Discussion:
%
%    The tetrahedron lattice layer L is bounded by the lines
%
%      0 <= X,
%      0 <= Y,
%      0 <= Z,
%      L - 1 < X / C(1) + Y / C(2) + Z/C(3) <= L.
%
%    In particular, layer L = 0 always contains the single point (0,0).
%
%    This function returns, one at a time, the points that lie within 
%    a given tetrahedron lattice layer.
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
%    Input, integer C(4), coefficients defining the 
%    lattice layer in entries 1 to 3, and the laver index in C(4).  
%    The coefficients should be positive, and C(4) must be nonnegative.
%
%    Input/output, integer V(3).  On first call for a given layer,
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
  n = 3;
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
    v(2:3) = 0;
    more = 1;

  else

    c1n = i4vec_lcm ( n, c );

    rhs1 = c1n * ( c(n+1) - 1 );
    rhs2 = c1n *   c(n+1);
%
%  Can we simply increase X?
%
    v(1) = v(1) + 1;

    lhs = ( c1n / c(1) ) * v(1) ...
        + ( c1n / c(2) ) * v(2) ...
        + ( c1n / c(3) ) * v(3);

    if ( lhs <= rhs2 )
%
%  No.  Increase Y, and set X so we just exceed RHS1...if possible.
%
    else

      v(2) = v(2) + 1;

      v(1) = floor ( ( c(1) * ( rhs1 - ( c1n / c(2) ) * v(2) ...
                                     - ( c1n / c(3) ) * v(3) ) ) / c1n );
      v(1) = max ( v(1), 0 );

      lhs = ( c1n / c(1) ) * v(1) ...
          + ( c1n / c(2) ) * v(2) ...
          + ( c1n / c(3) ) * v(3);

      if ( lhs <= rhs1 )
        v(1) = v(1) + 1;
        lhs = lhs + c1n / c(1);
      end
%
%  We have increased Y by 1.  Have we stayed below the upper bound?
%
      if ( lhs <= rhs2 )

      else
%
%  No.  Increase Z, and set X so we just exceed RHS1...if possible.
%
        v(3) = v(3) + 1;
        v(2) = 0;
        v(1) = floor ( ( c(1) * ( rhs1 - ( c1n / c(2) ) * v(2) ...
                                       - ( c1n / c(3) ) * v(3) ) ) / c1n );
        v(1) = max ( v(1), 0 );

        lhs = ( c1n / c(1) ) * v(1) ...
            + ( c1n / c(2) ) * v(2) ...
            + ( c1n / c(3) ) * v(3);

        if ( lhs <= rhs1 )
          v(1) = v(1) + 1;
          lhs = lhs + c1n / c(1);
        end

        if ( lhs <= rhs2 )

        else
          more = 0;
          v(1:n) = 0;
        end

      end
    end
  end

  return
end
