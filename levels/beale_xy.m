function f = beale_xy ( x, y )

%*****************************************************************************80
%
%% BEALE_XY computes the Beale function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Evelyn Beale,
%    On an Iterative Method for Finding a Local Minimum of a Function
%    of More than One Variable,
%    Technical Report 25, 
%    Statistical Techniques Research Group,
%    Princeton University, 1958.
%
%  Parameters:
%
%    Input, real X, Y, the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f1 = 1.5   - x * ( 1.0 - y    );
  f2 = 2.25  - x * ( 1.0 - y * y );
  f3 = 2.625 - x * ( 1.0 - y * y * y );

  f = f1 * f1 + f2 * f2 + f3 * f3;
 
  return
end
