function value = r4_abs ( x )

%*****************************************************************************80
%
%% R4_ABS returns the absolute value of an R4.
%
%  Discussion:
%
%    An R4 is a single precision real value.
%
%    MATLAB supplies the ABS function, which should be used instead
%    of this function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose absolute value is desired.
%
%    Output, real R4_ABS, the absolute value of X.
%
  if ( 0.0 <= x )
    value = + x;
  else
    value = - x;
  end

  return
end
