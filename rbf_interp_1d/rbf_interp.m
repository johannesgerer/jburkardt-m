function fi = rbf_interp ( m, nd, xd, r0, phi, w, ni, xi )

%*****************************************************************************80
%
%% RBF_INTERP evaluates a radial basis function interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2012
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
%    Input, real W(ND), the weights, as computed by RBF_WEIGHTS.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(M,NI), the interpolation points.
%
%    Output, real FI(NI), the interpolated values.
% 
  fi = zeros ( ni, 1 );

  for i = 1 : ni
    if ( m == 1 )
      d = xd - xi(i);
      r = abs ( d );
      v = phi ( r(1:nd), r0 );
      fi(i) = v' * w;
    else
      d = xd - repmat ( xi(:,i), 1, nd );
      r = sqrt ( sum ( d.^2 ) );
      v = phi ( r(1:nd), r0 );
      fi(i) = v * w;
    end
  end

  return
end
