function x = ihs ( dim_num, point_num, duplication )

%*****************************************************************************80
%
%% IHS implements the improved distributed hypercube sampling algorithm.
%
%  Discussion:
%
%    N Points in an M dimensional Latin hypercube are to be selected.
%    Each of the M coordinate dimensions is discretized to the values
%    1 through N.  The points are to be chosen in such a way that
%    no two points have any coordinate value in common.  This is
%    a standard Latin hypercube requirement, and there are many
%    solutions.
%
%    This algorithm differs in that it tries to pick a solution
%    which has the property that the points are "spread out"
%    as evenly as possible.  It does this by determining an optimal
%    even spacing, and using the DUPLICATION factor to allow it
%    to choose the best of the various options available to it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2014
%
%  Author:
%
%    John Burkardt
%    Improvements by Jeremy Dewar, Tulane University.
%
%  Reference:
%
%    Brian Beachkofski, Ramana Grandhi,
%    Improved Distributed Hypercube Sampling,
%    American Institute of Aeronautics and Astronautics Paper 2002-1274.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points to be generated.
%
%    Input, integer DUPLICATION, the duplication factor.  This must
%    be at least 1.  A value of 5 is reasonable.
%
%    Output, integer X(DIM_NUM,POINT_NUM), the points.
%
  opt = point_num / point_num^( 1.0 / dim_num );
%
%  Pick the first point.
%
  x = zeros ( dim_num, point_num );

  x(:,point_num) = randi ( point_num, [dim_num,1] );
%
%  Initialize AVAIL,
%  and set an entry in a random row of each column of AVAIL to POINT_NUM.
%
  avail = zeros(dim_num, point_num);
  for j = 1 : point_num
    avail(1:dim_num,j) = j;
  end

  for i = 1 : dim_num
    avail(i,x(i,point_num)) = point_num;
  end
%
%  Main loop:
%  Assign a value to X(1:DIM_NUM,COUNT) for COUNT = POINT_NUM-1 down to 2.
%
  for count = point_num-1 : -1 : 2
%
%  Generate valid points.
%
    for i = 1 : dim_num

      for k = 1 : duplication
        list(count*(k-1)+1:k*count) = avail(i,1:count);
      end

      point_idxs = randi ( k, [1,count*duplication] );
      for k = count*duplication : -1 : 1
        pk = point_idxs(k);
        point(i,k) = list(pk);
        list(pk) = list(k);
      end

    end
%
%  For each candidate, determine the distance to all the
%  points that have already been selected, and save the minimum value.
%
    min_all = realmax;
    best = 0;

    for k = 1 : duplication*count

      min_can = realmax;

      for j = count+1 : point_num
        dist = norm(point(:,k) - x(:,j));
        min_can = min ( min_can, dist );
      end

      if ( abs ( min_can - opt ) < min_all )
        min_all = abs ( min_can - opt );
        best = k;
      end

    end

    x(1:dim_num,count) = point(1:dim_num,best);
%
%  Having chosen X(*,COUNT), update AVAIL.
%
    for i = 1 : dim_num

      for j = 1 : point_num
        if ( avail(i,j) == x(i,count) )
          avail(i,j) = avail(i,count);
        end
      end

    end

  end
%
%  For the last point, there's only one choice.
%
  x(1:dim_num,1) = avail(1:dim_num,1);

  return
end
