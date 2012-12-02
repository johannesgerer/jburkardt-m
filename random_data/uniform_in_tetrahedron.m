function [ x, seed ] = reference_tet4_uniform2 ( v, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_TETRAHEDRON returns uniform points in a tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Claudio Rocchini, Paolo Cignoni,
%    Generating Random Points in a Tetrahedron,
%    Journal of Graphics Tools,
%    Volume 5, Number 5, 2000, pages 9-12.
%
%  Parameters:
%
%    Input, real V(3,4), the vertices of the tetrahedron.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(3,N), the points.
%
  for j = 1 : n

    [ c(1:3,1), seed ] = r8vec_uniform_01 ( 3, seed );

    if ( 1.0 < c(1,1) + c(2,1) )
      c(1,1) = 1.0 - c(1,1);
      c(2,1) = 1.0 - c(2,1);
    end

    if ( 1.0 < c(2,1) + c(3,1) )
      t = c(3,1);
      c(3,1) = 1.0 - c(1,1) - c(2,1);
      c(2,1) = 1.0 - t;
    elseif ( 1.0 < c(1,1) + c(2,1) + c(3,1) )
       t = c(3,1);
       c(3,1) = c(1,1) + c(2,1) + c(3,1) - 1.0;
       c(1,1) = 1.0 - c(2,1) - t;
    end

    c(4,1) = 1.0 - c(1,1) - c(2,1) - c(3,1);

    x(1:3,j) = v(1:3,1:4) * c(1:4,1);

  end

  return
end
