function v = phi1 ( r, r0 )

%*****************************************************************************80
%
%% PHI1 evaluates the multiquadric radial basis function.
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
%    Input, real R(), the radial separation.
%    0 < R.
%
%    Input, real R0, a scale factor.
%
%    Output, real V(), the value of the radial basis function.
%
  v = sqrt ( r.^2 + r0^2 );

  return
end
