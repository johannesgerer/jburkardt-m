function jac_dif = p00_jac_dif ( problem, option, nvar, x )

%*****************************************************************************80
%
%% P00_JAC_DIF estimates the jacobian via finite differences.
%
%  Discussion:
%
%    This is a relatively unsophisticated way of estimating the jacobian.
%    The value of the internal parameter REL, set below, can affect
%    the results in a strong way.  If the jacobian reported by this
%    routine seems unsatisfactory, check the results for values of
%    REL that are 10 times larger and smaller, and see if the trend
%    makes sense.  Values of REL that are too large for a given
%    problem will make crude estimates, but values that are too small
%    will result in roundoff, and in severe cases, the computation of
%    zeroes in the jacobian.
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
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the jacobian.
%
%    Output, real JAC_DIF(NVAR-1,NVAR), an estimate of the jacobian.
%
  rel = 0.0001;
%
%  Perturb each variable.
%
  for j = 1 : nvar
%
%  Save X(J), and compute a perturbation.
%
    xsave = x(j);
    dx = rel * ( abs ( xsave ) + 1.0 );
%
%  Compute the function value at X + dX.
%
    x(j) = xsave + dx;

    fxp = p00_fun ( problem, option, nvar, x );
%
%  Compute the function value at X - dX.
%
    x(j) = xsave - dx;

    fxm = p00_fun ( problem, option, nvar, x );
%
%  Restore X(J).
%
    x(j) = xsave;
%
%  Compute column J of the finite difference jacobian.
%
    jac_dif(1:nvar-1,j) = 0.5 * ( fxp(1:nvar-1) - fxm(1:nvar-1) ) / dx;

  end

  return
end
