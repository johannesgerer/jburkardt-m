function fx = p18_fun ( option, nvar, u )

%*****************************************************************************80
%
%% P18_FUN evaluates the function for problem 18.
%
%  Title:
%
%    The Semiconductor Problem.
%
%  Description:
%
%    The continuous problem is a two point boundary value problem
%    of the form
%
%      - U'' = G ( T, U, LAMBDA )
%
%    for A < T < B, with boundary conditions
%
%      U(A) = LAMBDA * UA,
%      U(B) = LAMBDA * UB.
%
%    and with right hand side:
%
%      G ( T, U, LAMBDA ) = LAMBDA *
%        ( CA * EXP ( LAMBDA * BETA * ( LAMBDA * UA - U ) )
%        - CB * EXP ( LAMBDA * BETA * ( U - LAMBDA * UB ) ) + H(T) )
%
%    and
%
%      H(T) = - CA for T <= 0,
%           =   CB for 0 < T.
%
%    The discrete version of the problem uses a mesh of M points
%    T(1) = A, T(2) = A + H, T(3) = A * 2 * H, ..., T(M) + B,
%    and corresponding solution values U(I).  The system of
%    M equations is:
%
%      U(1) = LAMBDA * UA
%
%      - U(I-1) + 2 * U(I) - U(I+1) = 2 * H * LAMBDA * G ( T(I), U(I), LAMBDA )
%
%      U(M) = LAMBDA * UB
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
%    SJ Polak, A Wachten, H Vaes, A deBeer, Cor denHeijer,<br>
%    A Continuation Method for the Calculation of Electrostatic
%    Potentials in Semiconductors,<br>
%    Technical Report ISA-TIS/CARD,<br>
%    NV Philips Gloeilampen-Fabrieken, 1979.
%
%    Cor denHeijer, Werner Rheinboldt,
%    On Steplength Algorithms for a Class of Continuation Methods,
%    SIAM Journal on Numerical Analysis,
%    Volume 18, Number 5, October 1981, pages 925-947.
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
  a = 0.0;
  b = 0.01;
  ua = 0.0;
  ub = 25.0;

  lambda = u(nvar);
  m = nvar - 1;
  h = 1.0 / ( m - 1  );
  fx(1) = u(1) - lambda * ua;

  for i = 2 : m - 1

    t = ( ( m - i ) * a + ( i - 1 ) * b ) / ( m - 1 );

    del2x = ( u(i-1) - 2.0 * u(i) + u(i+1) ) / ( 2.0 * h );

    fx(i) = del2x - p18_gx ( t, u(i), lambda );

  end

  fx(m) = u(m) - lambda * ub;

  return
end
