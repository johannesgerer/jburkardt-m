function p_interp = interp_lagrange ( m, data_num, t_data, p_data, ...
  interp_num, t_interp )

%*****************************************************************************80
%
%% INTERP_LAGRANGE: Lagrange polynomial interpolation to a curve in M dimensions.
%
%  Discussion:
%
%    From a space of M dimensions, we are given a sequence of
%    DATA_NUM points, which are presumed to be successive samples
%    from a curve of points P.
%
%    We are also given a parameterization of this data, that is,
%    an associated sequence of DATA_NUM values of a variable T.
%
%    Thus, we have a sequence of values P(T), where T is a scalar,
%    and each value of P is of dimension M.
%
%    We are then given INTERP_NUM values of T, for which values P
%    are to be produced, by linear interpolation of the data we are given.
%
%    The user may request extrapolation.  This occurs whenever
%    a T_INTERP value is less than the minimum T_DATA or greater than the
%    maximum T_DATA.  In that case, extrapolation is used.
%
%    For each spatial component, a polynomial of degree
%    ( DATA_NUM - 1 ) is generated for the interpolation.  In most cases,
%    such a polynomial interpolant begins to oscillate as DATA_NUM
%    increases, even if the original data seems well behaved.  Typically,
%    values of DATA_NUM should be no greater than 10%
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Input, real T_DATA(DATA_NUM), the value of the
%    independent variable at the sample points.
%
%    Input, real P_DATA(M,DATA_NUM), the value of the
%    dependent variables at the sample points.
%
%    Input, integer INTERP_NUM, the number of points
%    at which interpolation is to be done.
%
%    Input, real T_INTERP(INTERP_NUM), the value of the
%    independent variable at the interpolation points.
%
%    Output, real P_INTERP(M,DATA_NUM), the interpolated
%    values of the dependent variables at the interpolation points.
%

%
%  Evaluate the DATA_NUM Lagrange polynomials associated with T_DATA(1:DATA_NUM)
%  for the interpolation points T_INTERP(1:INTERP_NUM).
%
  l_interp = lagrange_value ( data_num, t_data, interp_num, t_interp );
%
%  Multiply P_DATA(1:M,1:DATA_NUM) * L_INTERP(1:DATA_NUM,1:INTERP_NUM)
%  to get P_INTERP(1:M,1:INTERP_NUM).
%
  p_interp(1:m,1:interp_num) = ...
    p_data(1:m,1:data_num) * l_interp(1:data_num,1:interp_num);

  return
end
