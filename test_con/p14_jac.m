function jac = p14_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P14_JAC computes the jacobian of problem 14.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  m = nvar - 1;
  h = 1.0 / ( m - 2 );
  lambda = x(nvar);
%
%  First equation.
%
  jac(1,1) = - 1.0;
  jac(1,3) =   1.0;
%
%  Intermediate equations.
%
  for i = 2 : m - 1

    t = ( i - 2 ) * h;
    tl = ( i - 2.5 ) * h;
    tr = ( i - 1.5 ) * h;
    ul = 0.5 * ( x(i-1) + x(i) );
    ur = 0.5 * ( x(i) + x(i+1) );

    jac(i,i) =   tl * tl * p14_fu ( lambda, ul ) ...
      + ( x(i) - x(i-1) ) * tl * tl * p14_fudu ( lambda, ul ) * 0.5 ...
      + tr * tr * p14_fu ( lambda, ur ) ...
      + ( x(i) - x(i+1) ) * tr * tr * p14_fudu ( lambda, ur ) * 0.5 ...
      + h * h * t * t * p14_gudu ( x(i) );

    jac(i,i-1) = - tl * tl * p14_fu ( lambda, ul ) ...
      + ( x(i) - x(i-1) ) * tl * tl * p14_fudu ( lambda, ul ) * 0.5;

    jac(i,i+1) =  - tr * tr * p14_fu ( lambda, ur ) ...
      + ( x(i) - x(i+1) ) * tr * tr * p14_fudu ( lambda, ur ) * 0.5;

    jac(i,nvar) = ( x(i) - x(i-1) ) * tl * tl * p14_fudl ( ul ) ...
      + ( x(i) - x(i+1) ) * tr * tr * p14_fudl ( ur );

  end
%
%  Last equation.
%
  jac(m,m) = 1.0;

  return
end
