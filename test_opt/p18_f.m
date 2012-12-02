function f = p18_f ( n, x )

%*****************************************************************************80
%
%% P18_F evaluates the objective function for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%

%
%  Compute FVEC.
%
  fvec = p18_fvec ( n, x );
%
%  Compute F.
%
  f = sum ( fvec(1:n).^2 );

  return
end
