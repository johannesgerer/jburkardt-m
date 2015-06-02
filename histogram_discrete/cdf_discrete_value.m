function cdf = cdf_discrete_value ( x_num, x, y, v_num, v )

%*****************************************************************************80
%
%% CDF_DISCRETE_VALUE evaluates the CDF of a discrete histogram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer V_NUM, the number of sample values.
%
%    Input, real V(V_NUM,1), the sample values.
%
%    Input, integer X_NUM, the number of values in the discrete histogram.
%
%    Input, real X(X_NUM,1), the histogram data values.
%
%    Input, real Y(X_NUM,1), the normalized histogram values.
%
%    Output, real PDF(V_NUM,1), the values of the discrete PDF.
%
  cdf = zeros ( v_num, 1 );
%
%  Seek bracket intervals for each sample point.
%
  b(1:v_num,1) = r8vec_bracket6 ( x_num, x, v_num, v );

  for i = 1 : v_num
    if ( v(i) <= x(1) )
      cdf(i) = 0.0;
    elseif ( x(x_num) <= v(i) )
      cdf(i) = 1.0;
    else
      for l = 1 : b(i) - 1
        r = l + 1;
        cdf(i) = cdf(i) + ( x(r) - x(l) ) * ( y(r) + y(l) ) / 2.0;
      end
      l = b(i);
      r = l + 1;
      yv = y(l) + ( v(i) - x(l) ) * ( y(r) - y(l) ) / ( x(r) - x(l) );
      cdf(i) = cdf(i) + ( v(i) - x(l) ) * ( yv + y(l) ) / 2.0;
    end
  end

  return
end

