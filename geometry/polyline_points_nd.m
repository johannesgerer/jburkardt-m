function pt = polyline_points_nd ( dim_num, nk, pk, nt )

%*****************************************************************************80
%
%% POLYLINE_POINTS_ND computes equally spaced points on a polyline in ND.
%
%  Discussion:
%
%    A polyline of order NK is the geometric structure consisting of
%    the NK-1 line segments that lie between successive elements of a list
%    of NK points.
%
%    An ordinary line segment is a polyline of order 2.
%    The letter "V" is a polyline of order 3.
%    The letter "N" is a polyline of order 4, and so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NK, the number of points defining the polyline.
%
%    Input, real PK(DIM_NUM,NK), the points defining the polyline.
%
%    Input, integer NT, the number of points to be sampled.
%
%    Input, real PT(DIM_NUM,NT), equally spaced points
%    on the polyline.
%
  sk = polyline_arclength_nd ( dim_num, nk, pk );

  j = 1;

  for i = 1 : nt

    st = ( ( nt - i     ) * 0.0 + ...
           (      i - 1 ) * sk(nk) ) ...
         / ( nt     - 1 );

    while ( 1 )

      if ( sk(j) <= st & st <= sk(j+1) )
        break
      end

      if ( nk - 1 <= j )
        break
      end

      j = j + 1;

    end

    pt(1:dim_num,i) = ( ( sk(j+1) - st         ) * pk(1:dim_num,j) ...
                   + (           st - sk(j) ) * pk(1:dim_num,j+1) ) ...
                   / ( sk(j+1)      - sk(j) );

  end

  return
end
