function value = index_to_level_closed ( dim_num, t, order, level_max )

%*****************************************************************************80
%
%% INDEX_TO_LEVEL_CLOSED determines the level of a point given its index.
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
%    Input, integer T(DIM_NUM), the grid indices of a point in a 1D closed rule.
%    0 <= T(I) <= ORDER.
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer LEVEL_MAX, the level with respect to which the
%    index applies.
%
%    Output, integer VALUE, the first level on which
%    the point associated with the given index will appear.
%
  value = 0;
  
  for dim = 1 : dim_num

    s = i4_modp ( t(dim), order );

    if ( s == 0 )

      level = 0;

    else

      level = level_max;

      while ( mod ( s, 2 ) == 0 )
        s = floor ( s / 2 );
        level = level - 1;
      end

    end

    if ( level == 0 )
      level = 1;
    elseif ( level == 1 )
      level = 0;
    end

    value = value + level;

  end

  return
end
