function value = monomial_value ( dim_num, point_num, x, expon )

%*****************************************************************************80
%
%% MONOMIAL_VALUE evaluates a monomial.
%
%  Discussion:
%
%    This routine evaluates a monomial of the form
%
%      product ( 1 <= dim <= dim_num ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points at which the
%    monomial is to be evaluated.
%
%    Input, real X(DIM_NUM,POINT_NUM), the point coordinates.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Output, real VALUE(POINT_NUM), the value of the monomial.
%
  value = ones ( 1, point_num );

  for dim = 1 : dim_num
    for point = 1 : point_num

      if ( x(dim,point) ~= 0.0 )
        value(1,point) = value(1,point) * x(dim,point)^expon(dim);
      elseif ( expon(dim) == 0 )

      else
        value(1,point) = 0.0;
      end

    end
  end

  return
end
