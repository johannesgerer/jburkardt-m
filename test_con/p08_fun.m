function fx = p08_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P08_FUN evaluates the function for problem 8.
%
%  Title:
%
%    Riks's mechanical problem.
%
%  Description:
%
%    The equations describe the equilibrium state of a structure made of
%    three springs with a common movable endpoint and the other
%    endpoints fixed.  A load is applied to the common endpoint.
%
%      X(1), X(2), and X(3) are the x, y, and z coordinates of the
%        common point.
%      X(4) is the magnitude of the load which is applied in the
%        X direction.
%
%    If C(I) is the spring constant for the I-th spring, and A(I,J)
%    is the J-th coordinate of the I-th fixed endpoint, then the
%    equation is:
%
%      F(J) = SUM(I=1,3) COEF(I)*(A(I,J)-X(J)) + P(J)
%
%    where
%
%      COEF(I) = C(I) * (NORM(A(I,*)-NORM(X-A(I,*))) / NORM(X-A(I,*) )
%
%    and
%
%      P=(X(4),X(5),X(6)) is an applied load, and
%
%      NORM(X) is the euclidean norm, and
%
%      c(1) + c(2) + c(3) = 1.0
%
%    Two augmenting equations control the load vector P:
%
%      F(4) = X(ival1) - val1.
%      F(5) = X(ival2) - val2.
%
%    For this example,
%
%      ival1=4, val1=0
%      ival2=5, val2=0
%
%    and hence the load is all in the Z direction.
%
%    We seek limit points in X(6).
%
%    In Riks's paper, there seem to be limit points in X(6) at 4.10 and
%    -3.84.  The current code does not confirm this.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    E Riks,
%    The Application of Newton's Method to the Problem of Elastic Stability,
%    Transactions of the ASME, Journal of Applied Mechanics,
%    December 1972, pages 1060-1065.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%
  [ aval, cval ] = p08_gx ( );

  fx(1:3) = 0.0;

  for i = 1 : 3

    fx(i) = 0.0;

    for j = 1 : 3
%
%  Compute norms.
%
      anrm = 0.0;
      xmanrm = 0.0;

      for k = 1 : 3
        anrm = anrm + aval(j,k)^2;
        xmanrm = xmanrm + ( x(k) - aval(j,k) )^2;
      end

      anrm = sqrt ( anrm );;
      xmanrm = sqrt ( xmanrm );

      fx(i) = fx(i) + cval(j) * ( 1.0 - anrm / xmanrm ) * ( x(i) - aval(j,i) );

    end
  end
%
%  Add the load vector: ( X(4), X(5), X(6) ).
%
  for i = 1 : 3
    fx(i) = fx(i) + x(i+3);
  end
%
%  Get constraints.
%
  [ ival1, ival2, val1, val2 ] = p08_hx ( option );

  fx(4) = x(ival1) - val1;
  fx(5) = x(ival2) - val2;

  return
end
