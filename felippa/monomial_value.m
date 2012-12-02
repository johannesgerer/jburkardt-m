function v = monomial_value ( dim_num, point_num, expon, x )

%*****************************************************************************80
%
%% MONOMIAL_VALUE evaluates a monomial.
%
%  Discussion:
%
%    F(X) = product ( 1 <= DIM <= DIM_NUM ) X(I)^EXPON(I)
%
%    with the convention that 0^0 = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Input, real X(DIM_NUM,POINT_NUM), the evaluation points.
%
%    Output, real V(POINT_NUM), the monomial values.
%
  v(1:point_num) = 1.0;

  for dim = 1 : dim_num
    if ( expon(dim) ~= 0.0 )
      v(1:point_num) = v(1:point_num) .* x(dim,1:point_num).^expon(dim);
    end
  end

  return
end
