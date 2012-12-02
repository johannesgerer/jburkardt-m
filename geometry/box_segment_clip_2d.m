function [ qa, qb, ival ] = box_segment_clip_2d ( p1, p2, pa, pb )

%*****************************************************************************80
%
%% BOX_SEGMENT_CLIP_2D uses a box to clip a line segment in 2D.
%
%  Discussion:
%
%    A box is assumed to be a rectangle with sides aligned on coordinate
%    axes.  It can be described by its low and high corner, P1 and P2:
%
%      points P so that P1(1:DIM_NUM) <= P(1:DIM_NUM) <= P2(1:DIM_NUM).
%
%    Thanks to Dennis Strelow for pointing out a typographical error, 
%    13 July 2005.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), the low and high corners of the box.
%
%    Input, real PA(2), PB(2), the endpoints of the line segment.
%
%    Output, real QA(2), QB(2), the clipped coordinates.
%
%    Output, integer IVAL:
%    -1, no part of the line segment is within the box.
%     0, no clipping was necessary.  The line segment is entirely within
%     the box.
%     1, PA was clipped.
%     2, PB was clipped.
%     3, PA and PB were clipped.
%
  dim_num = 2;

  l1 = 0;
  l2 = 0;

  qa(1:dim_num) = pa(1:dim_num);
  qb(1:dim_num) = pb(1:dim_num);
%
%  Require that XMIN <= X.
%
  if ( qa(1) < p1(1) & qb(1) < p1(1) )
    ival = -1;
    return
  end

  if ( qa(1) < p1(1) & p1(1) <= qb(1) )
    q(1) = p1(1);
    q(2) = qa(2) + ( qb(2) - qa(2) ) * ( q(1) - qa(1) ) / ( qb(1) - qa(1) );
    qa(1:2) = q(1:2);
    l1 = 1;
  elseif ( p1(1) <= qa(1) & qb(1) < p1(1) )
    q(1) = p1(1);
    q(2) = qa(2) + ( qb(2) - qa(2) ) * ( q(1) - qa(1) ) / ( qb(1) - qa(1) );
    qb(1:2) = q(1:2);
    l2 = 1;
  end
%
%  Require that X <= XMAX.
%
  if ( p2(1) < qa(1) & p2(1) < qb(1) )
    ival = -1;
    return
  end

  if ( p2(1) < qa(1) & qb(1) <= p2(1) )
    q(1) = p2(1);
    q(2) = qa(2) + ( qb(2) - qa(2) ) * ( q(1) - qa(1) ) / ( qb(1) - qa(1) );
    qa(1:2) = q(1:2);
    l1 = 1;
  elseif ( qa(1) <= p2(1) & p2(1) < qb(1) )
    q(1) = p2(1);
    q(2) = qa(2) + ( qb(2) - qa(2) ) * ( q(1) - qa(1) ) / ( qb(1) - qa(1) );
    qb(1:2) = q(1:2);
    l2 = 1;
  end
%
%  Require that YMIN <= Y.
%
  if ( qa(2) < p1(2) & qb(2) < p1(2) )
    ival = -1;
    return
  end

  if ( qa(2) < p1(2) & p1(2) <= qb(2) )
    q(2) = p1(2);
    q(1) = qa(1) + ( qb(1) - qa(1) ) * ( q(2) - qa(2) ) / ( qb(2) - qa(2) );
    qa(1:2) = q(1:2);
    l1 = 1;
  elseif ( p1(2) <= qa(2) & qb(2) < p1(2) )
    q(2) = p1(2);
    q(1) = qa(1) + ( qb(1) - qa(1) ) * ( q(2) - qa(2) ) / ( qb(2) - qa(2) );
    qb(1:2) = q(1:2);
    l2 = 1;
  end
%
%  Require that Y <= YMAX.
%
  if ( p2(2) < qa(2) & p2(2) < qb(2) )
    ival = -1;
    return
  end

  if ( p2(2) < qa(2) & qb(2) <= p2(2) )
    q(2) = p2(2);
    q(1) = qa(1) + ( qb(1) - qa(1) ) * ( q(2) - qa(2) ) / ( qb(2) - qa(2) );
    qa(1:2) = q(1:2);
    l1 = 1;
  elseif ( qa(2) <= p2(2) & p2(2) < qb(2) )
    q(2) = p2(2);
    q(1) = qa(1) + ( qb(1) - qa(1) ) * ( q(2) - qa(2) ) / ( qb(2) - qa(2) );
    qb(1:2) = q(1:2);
    l2 = 1;
  end

  ival = 0;

  if ( l1 )
    ival = ival + 1;
  end

  if ( l2 )
    ival = ival + 2;
  end

  return
end
