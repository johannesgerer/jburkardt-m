function value = not1 ( x1, x2, x3 )

%*****************************************************************************80
%
%% NOT1 evaluates a factor for serendipity basis functions.
%
%  Discussion:
%
%    not1(x1,x2,x3) evaluates at the point x1, the basis factor that
%    is 0 at x2 and 1 at x3:
%
%      not1(x1,x2,x3) = ( x1 - x2 ) / ( x3 - x2 )  
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
%    Output, real VALUE, the value of the basis function factor.
%
  value = ( x1 - x2 ) / ( x3 - x2 );

  return
end
