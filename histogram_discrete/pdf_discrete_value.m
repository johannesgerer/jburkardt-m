function pdf = pdf_discrete_value ( x_num, x, y, v_num, v )

%*****************************************************************************80
%
%% PDF_DISCRETE_VALUE evaluates the PDF of a discrete histogram.
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
  pdf = zeros ( v_num, 1 );
%
%  Seek bracket intervals for each sample point.
%
  b(1:v_num,1) = r8vec_bracket6 ( x_num, x, v_num, v );
%
%  Sample points outside the interval are ignored.
%
  i = find ( b ~= -1 );
%
%  Linearly interpolate values within the interval.
%
  l = b(i);
  r = l + 1;
%
% pdf(i) = (  ( x(r) - v(i)        ) .* y(l)   ...
%          +  (        v(i) - x(l) ) .* y(r) ) ...
%          ./ ( x(r)        - x(l) );

  for i = 1 : v_num
    if ( b(i) ~= -1 )
      l = b(i);
      r = l + 1;
      pdf(i) = (  ( x(r) - v(i)        ) .* y(l)   ...
               +  (        v(i) - x(l) ) .* y(r) ) ...
               ./ ( x(r)        - x(l) );
    end
  end

  return
end

