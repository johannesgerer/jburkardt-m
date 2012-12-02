function f = beale ( m, x )

%*****************************************************************************80
%
%% BEALE computes the Beale function.
%
%  Discussion:
%
%    This function has a global minimizer:
%
%      X = ( 3.0, 0.5 )
%
%    for which
%
%      F(X) = 0.
%
%    For a relatively easy computation, start the search at
%
%      X = ( 1.0, 1.0 )
%
%    A harder computation starts at
%
%      X = ( 1.0, 4.0 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Evelyn Beale,
%    On an Iterative Method for Finding a Local Minimum of a Function
%    of More than One Variable,
%    Technical Report 25, 
%    Statistical Techniques Research Group,
%    Princeton University, 1958.
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f1 = 1.5   - x(1) .* ( 1.0 - x(2)    );
  f2 = 2.25  - x(1) .* ( 1.0 - x(2).^2 );
  f3 = 2.625 - x(1) .* ( 1.0 - x(2).^3 );

  f = f1.^2 + f2.^2 + f3.^2;
 
  return
end
