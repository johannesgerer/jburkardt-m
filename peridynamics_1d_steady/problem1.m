function value = problem1 ( x, h, epsilon, o )

%*****************************************************************************80
%
%% PROBLEM1 evaluates problem data for problem 1.
%
%  Discussion:
%
%    case # 1: u_anl  =   x^3, w_anl = -6x
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
    value = x.^3;
  elseif ( o == 'd' )
    value = 3.0 * x.^2;
  elseif ( o == 'f' )
    value = - 6.0 * x;
  elseif ( o == 'l' )
    value = (x<0).*x.^3 + ...
            (x>=0 & x<=h).*0 + ...
            (x>h & x< 1-h).* 0 * epsilon + ...
            (x>=1-h & x<=1).* (1. + (x-1)./h)  + ...
            (x>1).*x.^3;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROBLEM1 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option O = "%s"\n', o );
    error ( 'PROBLEM1 - Fatal error!\n' );
  end

  return
end
