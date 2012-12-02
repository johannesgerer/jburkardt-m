function order = level_to_order_closed ( dim_num, level )

%*****************************************************************************80
%
%% LEVEL_TO_ORDER_CLOSED converts a level to an order for closed rules.
%
%  Discussion:
%
%    Sparse grids can naturally be nested.  A natural scheme is to use
%    a series of one-dimensional rules arranged in a series of "levels"
%    whose order roughly doubles with each step.
%
%    The arrangement described here works naturally for the Clenshaw Curtis
%    and Newton Cotes closed rules.  
%
%    The following table shows how the growth will occur:
%
%    Level    Order
%
%    0          1
%    1          3 =  2 + 1
%    2          5 =  4 + 1
%    3          9 =  8 + 1
%    4         17 = 16 + 1
%    5         33 = 32 + 1
%
%    For the Clenshaw Curtis and Newton Cotes Closed rules, the point growth
%    is nested.  If we have ORDER points on a particular LEVEL, the next
%    level includes all these old points, plus ORDER-1 new points, formed
%    in the gaps between successive pairs of old points.
%
%    Level    Order = New + Old
%
%    0          1   =  1  +  0
%    1          3   =  2  +  1
%    2          5   =  2  +  3
%    3          9   =  4  +  5
%    4         17   =  8  +  9
%    5         33   = 16  + 17
%
%    In this routine, we assume that a vector of levels is given,
%    and the corresponding orders are desired.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL(DIM_NUM), the nesting level.
%
%    Output, integer ORDER(DIM_NUM), the order (number of points) of the rule.
%
  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      order(dim) = -1;
    elseif ( level(dim) == 0 )
      order(dim) = 1;
    else
      order(dim) = ( 2^level(dim) ) + 1;
    end

  end
