function result = p00_box_gl05 ( problem, dim_num, sub_num )

%*****************************************************************************80
%
%% P00_BOX_GL05 uses Gauss-Legendre quadrature in an N-dimensional box. 
%
%  Discussion:
%
%    The rule is the product of 5-point Gauss-Legendre rules 
%    in each spatial dimension.
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
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer SUB_NUM, the number of subdivisions in each dimension.
%
%    Output, real RESULT, the approximate integral.
%
  norder = 5;

  weight = [ ...
    0.236926885056189087514264040720, ...
    0.478628670499366468041291514836, ...
    0.568888888888888888888888888889, ...
    0.478628670499366468041291514836, ...
    0.236926885056189087514264040720 ];
  xtab = [ ...
    - 0.906179845938663992797626878299, ...
    - 0.538469310105683091036314420700, ...
      0.0, ...
      0.538469310105683091036314420700, ...
      0.906179845938663992797626878299 ];
%
%  Get the integration limits, and the weight adjustment factor.
%
  [ a, b ] = p00_lim ( problem, dim_num );
%
%  Carry out the product rule.
%
  result = 0.0;
%
%  In the outer loop, we pick a sub-box.
%
  j = 0;
  sub_indx = [];

  while ( 1 )

    [ j, sub_indx ] = tuple_next ( 1, sub_num, dim_num, j, sub_indx );

    if ( j == 0 )
      break
    end

    for i = 1 : dim_num

      a_sub(i) = ( ( sub_num + 1 - sub_indx(i) ) * a(i)   ...
                 + (         - 1 + sub_indx(i) ) * b(i) ) ...
                 / ( sub_num                   );

      b_sub(i) = ( ( sub_num     - sub_indx(i) ) * a(i)   ...
                 + (               sub_indx(i) ) * b(i) ) ...
                 / ( sub_num                   );

    end
%
%  In the inner loop, we go through all the points in the
%  cross product of the quadrature rule.
%
    k = 0;
    indx = [];

    while ( 1 )

      [ k, indx ] = tuple_next ( 1, norder, dim_num, k, indx );

      if ( k == 0  )
        break
      end

      w = prod ( weight(indx(1:dim_num)) );

      x(1:dim_num,1) = 0.5 * ( ...
          a_sub(1:dim_num) .* ( 1.0 - xtab(indx(1:dim_num)) ) ...
        + b_sub(1:dim_num) .* ( 1.0 + xtab(indx(1:dim_num)) ) )';

      point_num = 1;
      value = p00_f ( problem, dim_num, point_num, x );

      result = result + w * value;

    end

  end
%
%  Get the volume.
%
  volume = p00_volume ( problem, dim_num );

  result = result * volume / ( 2 * sub_num )^dim_num;

  return
end
