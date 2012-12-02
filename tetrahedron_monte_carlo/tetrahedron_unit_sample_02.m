function [ p, seed ] = tetrahedron_unit_sample_02 ( p_num, seed )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_SAMPLE_02 selects points from the unit tetrahedron.
%
%  Discussion:
%
%    The unit tetrahedron has vertices (1,0,0), (0,1,0), (0,0,1), (0,0,0).
%
%    The sampling is uniform.
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
%  Reference:
%
%    Claudio Rocchini, Paolo Cignoni,
%    Generating Random Points in a Tetrahedron,
%    Journal of Graphics Tools,
%    Volume 5, Number 5, 2000, pages 9-12.
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

    [ c, seed ] = r8vec_uniform_01 ( 3, seed );

    if ( 1.0 < c(1) + c(2) )
      c(1) = 1.0 - c(1);
      c(2) = 1.0 - c(2);
    end if

    if ( 1.0 < c(2) + c(3) )
      t = c(3);
      c(3) = 1.0 - c(1) - c(2);
      c(2) = 1.0 - t;
    elseif ( 1.0 < c(1) + c(2) + c(3) )
       t = c(3);
       c(3) = c(1) + c(2) + c(3) - 1.0;
       c(1) = 1.0 - c(2) - t;
    end

    p(1:3,j) = c(1:3);

  end

  return
end
