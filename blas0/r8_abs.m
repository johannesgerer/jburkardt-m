function value = r8_abs ( x )

%*****************************************************************************80
%
%% R8_ABS returns the absolute value of an R8.
%
%  Discussion:
%
%    An R8 is a double precision real value.
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
%    Output, real R8_ABS, the absolute value of X.
%
  if ( 0.0 <= x )
    value = + x;
  else
    value = - x;
  end

  return
end
