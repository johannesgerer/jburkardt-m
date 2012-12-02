function pt = polyloop_points_nd ( dim_num, nk, pk, nt )

%*****************************************************************************80
%
%% POLYLOOP_POINTS_ND computes equally spaced points on a polyloop in ND.
%
%  Discussion:
%
%    A polyloop of order NK is the geometric structure consisting of
%    the NK line segments that lie between successive elements of a list
%    of NK points, including a segment from the last point to the first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NK, the number of points defining the polyloop.
%
%    Input, real PK(DIM_NUM,NK), the points defining the polyloop.
%
%    Input, integer NT, the number of points to be sampled.
%
%    Input, real PT(DIM_NUM,NT), equally spaced points
%    on the polyloop.
%
  sk = polyloop_arclength_nd ( dim_num, nk, pk );

  j = 1;

  for i = 1 : nt

    st = ( ( nt - i     ) * 0.0 + ...
           (      i - 1 ) * sk(nk+1) ) ...
         / ( nt     - 1 );

    while ( 1 )

      if ( sk(j) <= st & st <= sk(j+1) )
        break
      end

      if ( nk <= j )
        break
      end

      j = j + 1;

    end

    jp1 = i4_wrap ( j + 1, 1, nk );

    pt(1:dim_num,i) = ( ( sk(j+1) - st         ) * pk(1:dim_num,j) ...
                   + (           st - sk(j) ) * pk(1:dim_num,jp1) ) ...
                   / ( sk(j+1)      - sk(j) );

  end

  return
end
