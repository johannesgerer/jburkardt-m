function y = fcube ( x )

%*****************************************************************************80
%
%% FCUBE sets the cubic data values.
%
%  Discussion:
%
%    Y(X) = ( ( X + 2 ) * X + 3 ) * X + 4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real Y, the value of the function.
%
  y = ( ( (       1.0E+00 ) ...
                * x + 2.0E+00 ) ...
                * x + 3.0E+00 ) ...
                * x + 4.0E+00;

  return
end
