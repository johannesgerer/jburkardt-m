function value = problem5 ( x, h, epsilon, o )

%*****************************************************************************80
%
%% PROBLEM5 evaluates problem data for problem 5.
%
%  Discussion:
%
%    case # 5: u_anl  = 1+x, w_anl  =   0
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
    value = 1 + x;
  elseif ( o == 'd' )
    value = ones ( size ( x ) );
  elseif ( o == 'f' )
    value = zeros ( size ( x ) );
  elseif ( o == 'l' )
    value = (x<=0).*(1+x) + ...
            (x>0 & x<=h).* (1-x./h) + ...
            (x>h & x< 1-h).* 0 * epsilon + ...
            (x>=1-h & x<=1).*2.*(1. + (x-1)./h)  + ...
            (x>1).*(1+x);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROBLEM5 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option O = "%s"\n', o );
    error ( 'PROBLEM5 - Fatal error!\n' );
  end

  return
end
