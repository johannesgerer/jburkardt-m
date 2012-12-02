function [ v, more ] = triangle_lattice_point_next ( c, v, more )

%*****************************************************************************80
%
%% TRIANGLE_LATTICE_POINT_NEXT returns the next triangle lattice point.
%
%  Discussion:
%
%    The lattice triangle is defined by the vertices:
%
%      (0,0), (C(3)/C(1), 0) and (0,C(3)/C(2))
%
%    The lattice triangle is bounded by the lines
%
%      0 <= X,
%      0 <= Y
%      X / C(1) + Y / C(2) <= C(3)
%
%    Lattice points are listed one at a time, starting at the origin,
%    with X increasing first.
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
%    lattice triangle.  These should be positive.
%
%    Input/output, integer V(2).  On first call, the input
%    value is not important.  On a repeated call, the input value should
%    be the output value from the previous call.  On output, V contains
%    the next lattice point.
%
%    Input/output, logical MORE.  On input, set MORE to FALSE to indicate
%    that this is the first call for a given triangle.  Thereafter, the input
%    value should be the output value from the previous call.  On output,
%    MORE is TRUE if the returned value V is a new lattice point.
%    If the output value is FALSE, then no more lattice points were found,
%    and V was reset to 0, and the routine should not be called further
%    for this triangle.
%
  n = 2;

  if ( ~more )

    v(1:2) = 0;
    more = 1;

  else

    c1n = i4vec_lcm ( n, c );
    rhs = c1n * c(n+1);

    if ( c(2) * ( v(1) + 1 ) + c(1) * v(2) <= rhs )
      v(1) = v(1) + 1;
    else
      v(1) = 0;
      if ( c(2) * v(1) + c(1) * ( v(2) + 1 ) <= rhs )
        v(2) = v(2) + 1;
      else
        v(2) = 0;
        more = 0;
      end
    end

  end

  return
end
