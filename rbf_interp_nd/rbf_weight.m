function w = rbf_weight ( m, nd, xd, r0, phi, fd )

%*****************************************************************************80
%
%% RBF_WEIGHT computes weights for radial basis function interpolation.
%
%  Discussion:
%
%    We assume that there are N (nonsingular) equations in N unknowns.
%
%    However, it should be clear that, if we are willing to do some kind
%    of least squares calculation, we could allow for singularity,
%    inconsistency, or underdetermine systems.  This could be associated
%    with data points that are very close or repeated, a smaller number
%    of data points than function values, or some other ill-conditioning
%    of the system arising from a peculiarity in the point spacing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Press, Brian Flannery, Saul Teukolsky, William Vetterling,
%    Numerical Recipes in FORTRAN: The Art of Scientific Computing,
%    Third Edition,
%    Cambridge University Press, 2007,
%    ISBN13: 978-0-521-88068-8,
%    LC: QA297.N866.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(M,ND), the data points.
%
%    Input, real R0, a scale factor.  R0 should be larger than the typical
%    separation between points, but smaller than the maximum separation.
%    The value of R0 has a significant effect on the resulting interpolant.
%
%    Input, function V = PHI ( R, R0 ), a function handle to evaluate the radial
%    basis functions.
%
%    Input, real FD(ND,1), the function values at the data points.
%
%    Output, real W(ND,1), the weights.
%
  a = zeros ( nd, nd );
 
  for i = 1 : nd
    if ( m == 1 )
      d = xd - xd(i);
      r = abs ( d );
    else
      d = xd - repmat ( xd(:,i), 1, nd );
      r = sqrt ( sum ( d.^2 ) );
    end
    a(i,1:nd) = phi ( r(1:nd), r0 );
  end
%
%  Solve for the weights.
%
  w = a \ fd;

  return
end
