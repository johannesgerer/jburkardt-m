function [ p, seed ] = tetrahedron_unit_sample_01 ( p_num, seed )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_SAMPLE_01 selects points from the unit tetrahedron.
%
%  Discussion:
%
%    The unit tetrahedron has vertices (1,0,0), (0,1,0), (0,0,1), (0,0,0).
%
%    Any point in the unit tetrahedron CAN be chosen by this algorithm.
%
%    However, the points that are chosen tend to be clustered near
%    the centroid.
%
%    This routine is supplied as an example of "bad" sampling.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P_NUM, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real P(3,P_NUM), the points.
%
  for j = 1 : p_num

    [ e, seed ] = r8vec_uniform_01 ( 4, seed );

    e_sum = sum ( e(1:4) );

    e(1:4) = e(1:4) / e_sum;
%
%  We may take the values E(1:3) as being the barycentric
%  coordinates of the point.
%
    p(1:3,j) = e(1:3);

  end

  return
end
