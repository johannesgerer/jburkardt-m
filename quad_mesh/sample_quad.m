function [ xy, seed ] = sample_quad ( quad_xy, n, seed )

%*****************************************************************************80
%
%% SAMPLE_QUAD returns random points in a quadrilateral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real QUAD_XY(2,4), the coordinates of the nodes.
%
%    Input, integer N, the number of points to sample.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real XY(2,N), the sample points.
%
%    Output, integer SEED, a seed for the random number generator.
%
  t1(1:2,1) = quad_xy(1:2,1);
  t1(1:2,2) = quad_xy(1:2,2);
  t1(1:2,3) = quad_xy(1:2,3);

  area1 = triangle_area ( t1 );

  t2(1:2,1) = quad_xy(1:2,3);
  t2(1:2,2) = quad_xy(1:2,4);
  t2(1:2,3) = quad_xy(1:2,1);

  area2 = triangle_area ( t2 );

  if ( area1 < 0.0 | area2 < 0.0 )

    t1(1:2,1) = quad_xy(1:2,2);
    t1(1:2,2) = quad_xy(1:2,3);
    t1(1:2,3) = quad_xy(1:2,4);

    area1 = triangle_area ( t1 );

    t2(1:2,1) = quad_xy(1:2,4);
    t2(1:2,2) = quad_xy(1:2,1);
    t2(1:2,3) = quad_xy(1:2,2);

    area2 = triangle_area ( t2 );

    if ( area1 < 0.0 | area2 < 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SAMPLE_QUAD - Fatal error!\n' );
      fprintf ( 1, '  The quadrilateral nodes seem to be listed in\n' );
      fprintf ( 1, '  the wrong order, or the quadrilateral is\n' );
      fprintf ( 1, '  degenerate.\n' );
      error ( 'SAMPLE_QUAD - Fatal error!' );
    end

  end

  area_total = area1 + area2;
%
%  Choose a triangle at random, weighted by the areas.
%  Then choose a point in that triangle.
%
  for i = 1 : n

    [ r, seed ] = r8_uniform_01 ( seed );

    if ( r * area_total < area1 )
      [ xy(1:2,i), seed ] = triangle_sample ( t1, 1, seed );
    else
      [ xy(1:2,i), seed ] = triangle_sample ( t2, 1, seed );
    end

  end

  return
end
