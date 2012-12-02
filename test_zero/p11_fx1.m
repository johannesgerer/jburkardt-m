function fx1 = p11_fx1 ( x )

%*****************************************************************************80
%
%% P11_FX1 evaluates the derivative of the function for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the abscissa.
%
%    Output, real FX1, the first derivative of the function at X.
%
  epsilon = 0.00001;

  fx1 = - 4.0 * x.^3 * ( epsilon + 256.0 ) / ( 16.0 * x.^4 + epsilon ).^2;

  return
end
