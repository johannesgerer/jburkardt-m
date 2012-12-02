function [ v, more ] = simplex_lattice_point_next ( n, c, v, more )

%*****************************************************************************80
%
%% SIMPLEX_LATTICE_POINT_NEXT returns the next simplex lattice point.
%
%  Discussion:
%
%    The lattice simplex is defined by the vertices:
%
%      (0,0,...,0), (C(N+1)/C(1),0,...,0), (0,C(N+1)/C(2),...,0) ...
%      (0,0,...C(N+1)/C(N))
%
%    The lattice simplex is bounded by the lines
%
%      0 <= V(1:N),
%      V(1) / C(1) + V(2) / C(2) + ... + V(N) / C(N) <= C(N+1)
%
%    Lattice points are listed one at a time, starting at the origin,
%    with V(1) increasing first.
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
%    lattice simplex.  These should be positive.
%
%    Input/output, integer V(N).  On first call, the input
%    value is not important.  On a repeated call, the input value should
%    be the output value from the previous call.  On output, V contains
%    the next lattice point.
%
%    Input/output, logical MORE.  On input, set MORE to FALSE to indicate
%    that this is the first call for a given simplex.  Thereafter, the input
%    value should be the output value from the previous call.  On output,
%    MORE is TRUE if not only is the returned value V a lattice point,
%    but the routine can be called again for another lattice point.
%    If the output value is FALSE, then no more lattice points were found,
%    and V was reset to 0, and the routine should not be called further
%    for this simplex.
%
  if ( ~more )

    v(1:n) = 0;
    more = 1;

  else

    c1n = i4vec_lcm ( n, c );
    rhs = c1n * c(n+1);

    lhs = 0;
    for i = 1 : n
      term = 1;
      for j = 1 : n
        if ( i == j )
          term = term * v(j);
        else
          term = term * c(j);
        end
      end
      lhs = lhs + term;
    end

    for i = 1 : n

      if ( lhs + c1n / c(i) <= rhs )
        v(i) = v(i) + 1;
        more = 1;
        return
      end
      lhs = lhs - c1n * v(i) / c(i);
      v(i) = 0;
    end

    more = 0;

  end

  return
end
