function value = problem3 ( x, h, epsilon, o )

%*****************************************************************************80
%
%% PROBLEM3 evaluates problem data for problem 3.
%
%  Discussion:
%
%    case # 3  u_anl  = - x^6/15 + x^5/5 + (epsilon^2/12-1/6)x^4 + 
%                       - epsilon^2/6*x^3 + s*x^2
%              with s =   epsilon^4/45 + epsilon^2/12 - epsilon^4/24 and
%              w_anl  =   2*(x^4 - 2*x^3 +x^2)
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
    s = epsilon^4/45+epsilon^2/12-epsilon^4/24;
    value = -x.^6/15-x.^4/6 + x.^5/5 + epsilon^2/12*x.^4 - epsilon^2/6*x.^3 + s*x.^2;
  elseif ( o == 'd' )
    epsilon2 = epsilon.^2;
    s     = epsilon2^2/45+epsilon2/12-epsilon2^2/24; 
    value = -2/5*x.^5 + x.^4 + (epsilon2/3-2/3)*x.^3-epsilon2/2*x.^2+2*s*x;
  elseif ( o == 'f' )
    value = 2*(x.^4 - 2*x.^3 +x.^2);
  elseif ( o == 'l' )
    s     =  epsilon^4/45+epsilon^2/12-epsilon^4/24;
    value = (x<0).*(-x.^6/15-x.^4/6 + x.^5/5 + epsilon^2/12*x.^4 - epsilon^2/6*x.^3 + s*x.^2) + ...
            (x>=0 & x<=h).*0 + ...
            (x>h & x< 1-h).* 0 + ...
            (x>=1-h & x<=1).*(-1/30-epsilon^4/24+epsilon^4/45).* (1. + (x-1)./h) + ...
            (x>1).*(-x.^6/15-x.^4/6 + x.^5/5 + epsilon^2/12*x.^4 - epsilon^2/6*x.^3 + s.*x.^2);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROBLEM3 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option O = "%s"\n', o );
    error ( 'PROBLEM3 - Fatal error!\n' );
  end

  return
end
