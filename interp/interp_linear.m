function p_interp = interp_linear ( m, data_num, t_data, p_data, ...
  interp_num, t_interp )

%*****************************************************************************80
%
%% INTERP_LINEAR: piecewise linear interpolation to a curve in M dimensions.
%
%  Discussion:
%
%    From a space of M dimensions, we are given a sequence of
%    DATA_NUM points, which are presumed to be successive samples
%    from a curve of points P.
%
%    We are also given a parameterization of this data, that is,
%    an associated sequence of DATA_NUM values of a variable T.
%    The values of T are assumed to be strictly increasing.
%
%    Thus, we have a sequence of values P(T), where T is a scalar,
%    and each value of P is of dimension M.
%
%    We are then given INTERP_NUM values of T, for which values P
%    are to be produced, by linear interpolation of the data we are given.
%
%    Note that the user may request extrapolation.  This occurs whenever
%    a T_INTERP value is less than the minimum T_DATA or greater than the
%    maximum T_DATA.  In that case, linear extrapolation is used.
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
%    independent variable at the sample points.  The values of T_DATA
%    must be strictly increasing.
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
  if ( ~r8vec_ascends_strictly ( data_num, t_data ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INTERP_LINEAR - Fatal error!\n' );
    fprintf ( 1, '  Independent variable array T_DATA is not strictly increasing.\n' );
    error ( 'INTERP_LINEAR - Fatal error!' );
  end

  for interp = 1 : interp_num

    t = t_interp(interp);
%
%  Find the interval [ TDATA(LEFT), TDATA(RIGHT) ] that contains, or is
%  nearest to, TVAL.
%
    [ left, right ] = r8vec_bracket ( data_num, t_data, t );

    p_interp(1:m,interp) = ...
      ( ( t_data(right) - t                ) * p_data(1:m,left)   ...
      + (                 t - t_data(left) ) * p_data(1:m,right) ) ...
      / ( t_data(right)     - t_data(left) );

  end

  return
end
