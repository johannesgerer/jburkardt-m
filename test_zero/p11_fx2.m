function fx2 = p11_fx2 ( x )

%*****************************************************************************80
%
%% P11_FX2 evaluates the second derivative of the function for problem 11.
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
%    Output, real FX2, the second derivative of the function at X.
%
  epsilon = 0.00001;

  fx2 = - 4.0 * ( epsilon + 256.0 ) * ( 3.0 * epsilon - 80.0 * x.^4 ) * x.^2
    / ( 16.0 * x.^4 + epsilon ).^3;

  return
end
