function p_interp = interp_nearest ( m, data_num, t_data, p_data, ...
  interp_num, t_interp )

%*****************************************************************************80
%
%% INTERP_NEAREST: Nearest neighbor interpolation to a curve in M dimensions.
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
%    are to be produced, by nearest neighbor interpolation.
%
%    The user may request extrapolation.  This occurs whenever
%    a T_INTERP value is less than the minimum T_DATA or greater than the
%    maximum T_DATA.  In that case, extrapolation is used.
%
%    The resulting interpolant is piecewise constant.
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
%  For each interpolation point, find the index of the nearest data point.
%
  for ji = 1 : interp_num
    jd = r8vec_sorted_nearest ( data_num, t_data, t_interp(ji) );
    p_interp(1:m,ji) = p_data(1:m,jd);
  end

  return
end
