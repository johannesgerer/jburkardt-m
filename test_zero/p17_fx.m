function fx = p17_fx ( x )

%*****************************************************************************80
%
%% P17_FX evaluates the function for problem 17.
%
%  Discussion:
%
%    This simple example is of historical interest, since it was used
%    by Wallis to illustrate the use of Newton's method, and has been
%    a common example ever since.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX(*), the value of the function at X.
%
  fx = x.^3 - 2.0 * x - 5.0;

  return
end
