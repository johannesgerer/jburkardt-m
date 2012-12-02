function value = p13_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P13_F evaluates the integrand for problem 13.
%
%  Dimension:
%
%    DIM_NUM arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integrand:
%
%    product ( 1 <= i <= dim_num ) t(n(i))(2*x(i)-1)
%
%    where T(N)(X) is the Chebyshev polynomial of order N,
%    and N(I) = mod ( i, 4 ) + 1.
%
%  Exact Integral:
%
%    0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Harald Niederreiter,
%    Implementation and Tests of Low-Discrepancy Sequences,
%    ACM Transactions on Modeling and Computer Simulation,
%    Volume 2, Number 3, July 1992, pages 195-213.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the argument.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real X(DIM_NUM,POINT_NUM), the evaluation points.
%
%    Output, real VALUE(POINT_NUM), the integrand values.
%
  value(1:point_num) = 1.0;

  for point = 1 : point_num

    for dim = 1 : dim_num

      t = 2.0 * x(dim,point) - 1.0;
      k = mod ( dim, 4 );

      if ( k == 1 )
        factor = t;
      elseif ( k == 2 )
        factor = 2.0 * t - 1.0;
      elseif ( k == 3 )
        factor = ( 4.0 * t - 3.0 ) * t;
      elseif ( k == 4 )
        factor = ( 8.0 * t - 8.0 * t + 1.0 );
      end

      value(point) = value(point) * factor;

    end

  end

  p13_i4 ( 'I', '#', point_num );

  return
end
