function order = level_to_order_open ( dim_num, level )

%*****************************************************************************80
%
%% LEVEL_TO_ORDER converts a level to an order for open rules.
%
%  Discussion:
%
%    Sparse grids can naturally be nested.  A natural scheme is to use
%    a series of one-dimensional rules arranged in a series of "levels"
%    whose order roughly doubles with each step.
%
%    The arrangement described here works naturally for the Fejer Type 1,
%    Fejer Type 2, Newton Cotes Open, Newton Cotes Half Open,
%    and Gauss-Patterson rules.  It also can be used, partially, to describe
%    the growth of Gauss-Legendre rules.
%
%    The idea is that we start with LEVEL = 0, ORDER = 1 indicating the single
%    point at the center, and for all values afterwards, we use the relationship
%
%      ORDER = 2**(LEVEL+1) - 1.
%
%    The following table shows how the growth will occur:
%
%    Level    Order
%
%    0          1
%    1          3 =  4 - 1
%    2          7 =  8 - 1
%    3         15 = 16 - 1
%    4         31 = 32 - 1
%    5         63 = 64 - 1
%
%    For the Fejer Type 1, Fejer Type 2, Newton Cotes Open,
%    Newton Cotes Open Half, and Gauss-Patterson rules, the point growth is
%    nested.  If we have ORDER points on a particular LEVEL, the next level
%    includes all these old points, plus ORDER+1 new points, formed in the
%    gaps between successive pairs of old points plus an extra point at each
%    end.
%
%    Level    Order = New + Old
%
%    0          1   =  1  +  0
%    1          3   =  2  +  1
%    2          7   =  4  +  3
%    3         15   =  8  +  7
%    4         31   = 16  + 15
%    5         63   = 32  + 31
%
%    If we use a series of Gauss-Legendre rules, then there is almost no
%    nesting, except that the central point is shared.  If we insist on
%    producing a comparable series of such points, then the "nesting" behavior
%    is as follows:
%
%    Level    Order = New + Old
%
%    0          1   =  1  +  0
%    1          3   =  2  +  1
%    2          7   =  6  +  1
%    3         15   = 14  +  1
%    4         31   = 30  +  1
%    5         63   = 62  +  1
%
%    Moreover, if we consider ALL the points used in such a set of "nested"
%    Gauss-Legendre rules, then we must sum the "NEW" column, and we see that
%    we get roughly twice as many points as for the truly nested rules.
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
%    18 April 2007
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
%    Output, integer ORDER(DIM_NUM,1), the order (number of points) of the rule.
%
  order = zeros ( dim_num, 1 );

  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      order(dim,1) = -1;
    elseif ( level(dim) == 0 )
      order(dim,1) = 1;
    else
      order(dim,1) = 2^( level(dim) + 1 ) - 1;
    end

  end

  return
end
