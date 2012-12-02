function v = phi3 ( r, r0 )

%*****************************************************************************80
%
%% PHI3 evaluates the thin-plate spline radial basis function.
%
%  Discussion:
%
%    Note that PHI3(R,R0) is negative if R < R0.  Thus, for this basis function,
%    it may be desirable to choose a value of R0 smaller than any possible R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2012
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
%    Input, real R(), the radial separation.
%    0 < R.
%
%    Input, real R0, a scale factor.
%
%    Output, real V(), the value of the radial basis function.
%
  v = zeros ( size ( r ) );
  i = find ( r ~= 0 );
  v(i) = r(i).^2 .* log ( r(i) / r0 );

  return
end
