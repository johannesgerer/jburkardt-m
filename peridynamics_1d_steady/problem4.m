function value = problem4 ( x, h, epsilon, o )

%*****************************************************************************80
%
%% PROBLEM4 evaluates problem data for problem 4.
%
%  Discussion:
%
%    case # 4: u_anl  =   x-1/4.......................................x<0.5
%                         x-1/2.......................................x>0.5 
%              
%              w_anl  =   0...................................x<0.5-epsilon
%                        -2/epsilon^2(-1/4(log(epsilon)-
%                         log(1/2-v)))....................0.5-epsilon<x<0.5
%                         2/epsilon^2( 1/4*(log(v-1/2)-
%                         log(epsilon)))..................0.5<x<0.5+epsilon
%                         0...................................x>0.5+epsilon
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2012
%
%  Parameters:
%
%    Input, real X(:), the evaluation points.
%
%    Input, real H, the discretization parameter.
%
%    Input, real EPSILON, the nonlocalization parameter.
%
%    Input, string O, the option:
%    'U', evaluate the exact solution.
%    'D', evaluate the derivative of the exact solution.
%    'F', evaluate the right hand side.
%    'L', evaluate the lifting function.
%
  if ( o == 'u' )
    value = (x-1/4).*(x<0.5) + (x-1/2).*(x>=0.5);
  elseif ( o == 'd' )
    value = zeros ( size ( x ) );
  elseif ( o == 'f' )
    epsilon2 = epsilon * epsilon;
    value = (x<0.5-epsilon).*0 + ...
            (x>=0.5-epsilon & x<0.5).*(-2)/epsilon2.*(-1/4* (log(epsilon)-log(1/2-x))) + ...
            (x>0.5 & x<0.5+epsilon).*2/epsilon2.*(1/4*(log(x-1/2)-log(epsilon))) + ...
            (x>=0.5+epsilon).*0;
  elseif ( o == 'l' )
    value = (x<=0).*(x-1/4) + ...
            (x>0 & x<=h).* (1/4).*(x./h-1)+ ...
            (x>h & x< 1-h).* 0 * epsilon + ...
            (x>=1-h & x<=1).* (1/2).*(1. + (x-1)./h)  + ...
            (x>1).*(x-1/2);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROBLEM4 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option O = "%s"\n', o );
    error ( 'PROBLEM4 - Fatal error!\n' );
  end

  return
end
