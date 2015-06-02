function value = not1d ( x1, x2, x3 )

%*****************************************************************************80
%
%% NOT1D differentiates a factor for serendipity basis functions.
%
%  Discussion:
%
%    not1(x1,x2,x3) evaluates at the point x1, the basis factor that
%    is 0 at x2 and 1 at x3:
%
%      not1(x1,x2,x3) = ( x1 - x2 ) / ( x3 - x2 )  
%
%    This function returns the derivative of the factor with respect to x1:
%
%      not1d(x1,x2,x3) = 1 / ( x3 - x2 );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, the evaluation point.
%
%    Input, real X2, X3, values that define the factor.
%
%    Output, real VALUE, the derivative of the basis function factor.
%
  value = 1.0 / ( x3 - x2 );

  return
end
