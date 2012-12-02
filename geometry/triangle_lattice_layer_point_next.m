function [ v, more ] = triangle_lattice_layer_point_next ( c, v, more )

%*****************************************************************************80
%
%% TRIANGLE_LATTICE_LAYER_POINT_NEXT: next triangle lattice layer point.
%
%  Discussion:
%
%    The triangle lattice layer L is bounded by the lines
%
%      0 <= X,
%      0 <= Y,
%      L - 1 < X / C(1) + Y / C(2) <= L.
%
%    In particular, layer L = 0 always contains the single point (0,0).
%
%    This function returns, one at a time, the points that lie within 
%    a given triangle lattice layer.
%
%    Thus, if we set C(1) = 2, C(2) = 3, then we get the following layers:
%
%    L = 0: (0,0)
%    L = 1: (1,0), (2,0), (0,1), (1,1), (0,2), (0,3)
%    L = 2: (3,0), (4,0), (2,1), (3,1), (1,2), (2,2), (1,3), (2,3),
%           (0,4), (1,4), (0,5), (0,6).
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
%    Input, integer C(3), coefficients defining the 
%    lattice layer.  Entry C(3) contains the layer index.
%    C(1) and C(2) should be positive, and C(3) must be nonnegative.
%
%    Input/output, integer V(2).  On first call for a given layer,
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
  n = 2;
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
%  Compute first point.
%
  if ( ~more )

    v(1) = ( c(3) - 1 ) * c(1) + 1;
    v(2) = 0;
    more = 1;

  else

    c1n = i4vec_lcm ( n, c );

    rhs1 = c1n * ( c(3) - 1 );
    rhs2 = c1n *   c(3);

    if ( c(2) * ( v(1) + 1 ) + c(1) * v(2) <= rhs2 )
      v(1) = v(1) + 1;
    else
      v(1) = floor ( ( rhs1 - c(1) * ( v(2) + 1 ) ) / c(2) );
      v(1) = max ( v(1), 0 );
      v(2) = v(2) + 1;
      if ( c(2) * v(1) + c(1) * v(2) <= rhs1 )
        v(1) = v(1) + 1;
      end
      if ( c(2) * v(1) + c(1) * v(2) <= rhs2 )

      else
        v(1:n) = 0;
        more = 0;
      end
    end   
  end

  return
end
