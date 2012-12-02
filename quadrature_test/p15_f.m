function value = p15_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P15_F evaluates the integrand for problem 15.
%
%  Dimension:
%
%    N arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integral Parameters:
%
%    N determines the order of the product.  It defaults to 1.
%    You can modify N by calling P15_I4.
%
%  Integrand:
%
%    f(x) = product ( 1 <= I <= N ) X(MOD(I-1,DIM_NUM)+1)
%
%  Exact integral:
%
%    product ( 1 / exponent(1:DIM_NUM) )
%
%    where, if I <= N - DIM_NUM * ( N/DIM_NUM),
%    
%      exponent ( I ) = ( N / dim_num ) + 2 
%
%    else
%
%      exponent ( I ) = ( N / dim_num ) + 1
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
  n = 0;
  n = p15_i4 ( 'G', 'N', n );

  fraction = floor ( n / dim_num );
  remainder = n - fraction * dim_num;


  value(1:point_num) = 1.0;

  for point = 1 : point_num

    if ( any ( x(1:dim_num,point) == 0.0 ) )

      value(point) = 0.0;

    else 

      for dim = 1 : dim_num
        if ( dim <= remainder )
          value(point) = value(point) * x(dim,point) ^ ( fraction + 1 );
        elseif ( fraction ~= 0 )
          value(point) = value(point) * x(dim,point) ^ fraction;
        end
      end

    end

  end

  p15_i4 ( 'I', '#', point_num );

  return
end
