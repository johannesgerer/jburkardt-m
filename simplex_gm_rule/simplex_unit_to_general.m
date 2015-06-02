function phy = simplex_unit_to_general ( dim_num, point_num, t, ref )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_TO_GENERAL maps the unit simplex to a general simplex.
%
%  Discussion:
%
%    Given that the unit simplex has been mapped to a general simplex
%    with vertices T, compute the images in T, under the same linear
%    mapping, of points whose coordinates in the unit simplex are REF.
%
%    The vertices of the unit simplex are listed as suggested in the
%    following:
%
%      (0,0,0,...,0)
%      (1,0,0,...,0)
%      (0,1,0,...,0)
%      (0,0,1,...,0)
%      (...........)
%      (0,0,0,...,1)
%
%    Thanks to Andrei ("spiritualworlds") for pointing out a mistake in the
%    previous implementation of this routine, 02 March 2008.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points to transform.
%
%    Input, real T(DIM_NUM,DIM_NUM+1), the vertices of the
%    general simplex.
%
%    Input, real REF(DIM_NUM,POINT_NUM), points in the
%    reference triangle.
%
%    Output, real PHY(DIM_NUM,POINT_NUM), corresponding points
%    in the physical triangle.
%

%
%  The image of each point is initially the image of the origin.
%
%  Insofar as the pre-image differs from the origin in a given vertex
%  direction, add that proportion of the difference between the images
%  of the origin and the vertex.
%
  for dim = 1 : dim_num 

    phy(dim,1:point_num) = t(dim,1);

    for vertex = 2 : dim_num + 1

      phy(dim,1:point_num) = phy(dim,1:point_num) ...
        + ( t(dim,vertex) - t(dim,1) ) * ref(vertex-1,1:point_num);

    end

  end

  return
end
