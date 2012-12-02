function value = problem2 ( x, h, epsilon, o )

%*****************************************************************************80
%
%% PROBLEM2 evaluates problem data for problem 2.
%
%  Discussion:
%
%    case # 2: u_anl  =   x^2(1-x^2), w_anl = 2*(6*x.^2 -1 + 0.5*epsilon^2)
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
    value = x.^2 .* ( 1 - x.^2 );
  elseif ( o == 'd' )
    value = 2 * x - 4 * x.^3;
  elseif ( o == 'f' )
    value = 2 * ( 6 * x.^2 - 1 + 0.5 * epsilon * epsilon );
  elseif ( o == 'l' )
    value = (x<0).*x.^2.*(1-x.^2) + ...
            (x>=0 & x<=h).*0 + ...
            (x>h & x< 1-h).* 0 * epsilon + ...
            (x>=1-h & x<=1).* 0 + ...
            (x>1).*x.^2.*(1-x.^2);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROBLEM2 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option O = "%s"\n', o );
    error ( 'PROBLEM2 - Fatal error!\n' );
  end

  return
end
