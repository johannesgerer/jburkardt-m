function l_interp = lagrange_value ( data_num, t_data, interp_num, t_interp )

%*****************************************************************************80
%
%% LAGRANGE_VALUE evaluates the Lagrange polynomials.
%
%  Discussion:
%
%    Given DATA_NUM distinct abscissas, T_DATA(1:DATA_NUM),
%    the I-th Lagrange polynomial L(I)(T) is defined as the polynomial of
%    degree DATA_NUM - 1 which is 1 at T_DATA(I) and 0 at the DATA_NUM - 1
%    other abscissas.
%
%    A formal representation is:
%
%      L(I)(T) = Product ( 1 <= J <= DATA_NUM, I /= J )
%       ( T - T(J) ) / ( T(I) - T(J) )
%
%    This routine accepts a set of INTERP_NUM values at which all the Lagrange
%    polynomials should be evaluated.
%
%    Given data values P_DATA at each of the abscissas, the value of the
%    Lagrange interpolating polynomial at each of the interpolation points
%    is then simple to compute by matrix multiplication:
%
%      P_INTERP(1:INTERP_NUM) =
%        P_DATA(1:DATA_NUM) * L_INTERP(1:DATA_NUM,1:INTERP_NUM)
%
%    or, in the case where P is multidimensional:
%
%      P_INTERP(1:M,1:INTERP_NUM) =
%        P_DATA(1:M,1:DATA_NUM) * L_INTERP(1:DATA_NUM,1:INTERP_NUM)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DATA_NUM, the number of data points.
%    DATA_NUM must be at least 1.
%
%    Input, real T_DATA(DATA_NUM), the data points.
%
%    Input, integer INTERP_NUM, the number of interpolation points.
%
%    Input, real T_INTERP(INTERP_NUM), the interpolation points.
%
%    Output, real L_INTERP(DATA_NUM,INTERP_NUM), the values
%    of the Lagrange polynomials at the interpolation points.
%

%
%  Evaluate the polynomial.
%
  l_interp(1:data_num,1:interp_num) = 1.0;

  for i = 1 : data_num

    for j = 1 : data_num

      if ( j ~= i )

        l_interp(i,1:interp_num) = l_interp(i,1:interp_num) ...
          .* ( t_interp(1:interp_num) - t_data(j) ) / ( t_data(i) - t_data(j) );

      end

    end

  end

  return
end
