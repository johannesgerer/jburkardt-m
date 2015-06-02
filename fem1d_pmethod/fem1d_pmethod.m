function fem1d_pmethod ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEM1D_PMETHOD.
%
%  Discussion:
%
%    FEM1D_PMETHOD implements the P-version of the finite element method.
%
%    Program to solve the one dimensional problem:
%
%      - d/dX (P dU/dX) + Q U  =  F
%
%    by the finite-element method using a sequence of polynomials
%    which satisfy the boundary conditions and are orthogonal
%    with respect to the inner product:
%
%      (U,V)  =  Integral (-1 to 1) P U' V' + Q U V dx
%
%    Here U is an unknown scalar function of X defined on the
%    interval [-1,1], and P, Q and F are given functions of X.
%
%    The boundary values are U(-1) = U(1)=0.
%
%    Sample problem #1:
%
%      U=1-x^4,        P=1, Q=1, F=1.0+12.0*x^2-x^4
%
%    Sample problem #2:
%
%      U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x)
%
%    The program should be able to get the exact solution for
%    the first problem, using NP = 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge.
%    MATLAB version by John Burkardt.
%
%  Local Parameters:
%
%    Local, real A(0:NP), the squares of the norms of the
%    basis functions.
%
%    Local, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Local, real F(1:NP+1).
%    F contains the basis function coefficients that form the
%    representation of the solution U.  That is,
%      U(X)  =  SUM (I=0 to NP) F(I+1) * BASIS(I)(X)
%    where "BASIS(I)(X)" means the I-th basis function
%    evaluated at the point X.
%
%    Local, integer NP.
%    The highest degree polynomial to use.
%
%    Local, integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out at the end of the computation.
%
%    Local, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Local, integer QUAD_NUM, the order of the quadrature rule.
%
%    Local, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Local, real QUAD_X(QUAD_NUM), the quadrature abscissas.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_PMETHOD\n' );
  fprintf ( 1, '  MATLAB version\n' );

  np = 2;
  quad_num = 10;
  nprint = 10;
  problem = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the two-point boundary value problem\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  - d/dX (P dU/dX) + Q U  =  F\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  on the interval [-1,1], with\n' );
  fprintf ( 1, '  U(-1) = U(1) = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The P method is used, which represents U as\n' );
  fprintf ( 1, '  a weighted sum of orthogonal polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Highest degree polynomial to use is %d\n', np );
  fprintf ( 1, '  Number of points to be used for output = %d\n', nprint );

  if ( problem == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem #1:\n' );
    fprintf ( 1, '  U=1-x^4,\n' );
    fprintf ( 1, '  P=1,\n' );
    fprintf ( 1, '  Q=1,\n' );
    fprintf ( 1, '  F=1 + 12 * x^2 - x^4\n' );
  elseif ( problem == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem #2:\n' );
    fprintf ( 1, '  U=cos(0.5*pi*x),\n' );
    fprintf ( 1, '  P=1,\n' );
    fprintf ( 1, '  Q=0,\n' );
    fprintf ( 1, '  F=0.25*pi*pi*cos(0.5*pi*x)\n' );
  end
%
%  Get quadrature abscissas and weights for interval [-1,1].
%
  [ quad_w, quad_x ] = quad ( quad_num );
%
%  Compute the constants for the recurrence relationship
%  that defines the basis functions.
%
  [ a, alpha, beta ] = alpbet ( np, problem, quad_num, quad_w, quad_x );
%
%  Test the orthogonality of the basis functions.
%
  ortho ( a, alpha, beta, np, problem, quad_num, quad_w, quad_x );
%
%  Solve for the solution of the problem, in terms of coefficients
%  of the basis functions.
%
  f = sol ( a, alpha, beta, np, problem, quad_num, quad_w, quad_x );
%
%  Print out the solution, evaluated at each of the NPRINT points.
%
  solution_print ( alpha, beta, f, np, nprint );
%
%  Compare the computed and exact solutions.
%
  exact ( alpha, beta, f, np, nprint, problem, quad_num, quad_w, quad_x );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_PMETHOD\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, alpha, beta ] = alpbet ( np, problem, quad_num, quad_w, quad_x )

%*****************************************************************************80
%
%% ALPBET calculates the coefficients in the recurrence relationship.
%
%  Discussion:
%
%    ALPHA and BETA are the coefficients in the three
%    term recurrence relation for the orthogonal basis functions
%    on [-1,1].
%
%    The routine also calculates A, the square of the norm of each basis
%    function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Output, real A(1:NP+1), the squares of the norms of the
%    basis functions.
%
%    Output, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Input, integer NP.
%    The highest degree polynomial to use.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Input, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Input, real QUAD_X(QUAD_NUM), the quadrature abscissas.
%
  ss = 0.0;
  su = 0.0;

  for iq = 1 : quad_num

    x = quad_x(iq);

    s = 4.0 * pp ( x, problem ) * x * x ...
      + qq ( x, problem ) * ( 1.0 - x * x )^2;

    u = 2.0 * pp ( x, problem ) * x * ( 3.0 * x * x - 1.0 ) ...
      + x * qq ( x, problem ) * ( 1.0 - x * x )^2;

    ss = ss + s * quad_w(iq);
    su = su + u * quad_w(iq);

  end

  beta(1) = 0.0;
  a(1) = ss;
  alpha(1) = su / ss;

  for i = 2 : np + 1

    ss = 0.0;
    su = 0.0;
    sv = 0.0;

    for iq = 1 : quad_num

      x = quad_x(iq);
%
%  Three term recurrence for Q and Q'.
%
      qm1 = 0.0;
      q = 1.0;
      qm1x = 0.0;
      qx = 0.0;

      for k = 1 : i - 1

        qm2 = qm1;
        qm1 = q;
        q = ( x - alpha(k) ) * qm1 - beta(k) * qm2;

        qm2x = qm1x;
        qm1x = qx;
        qx = qm1 + ( x - alpha(k) ) * qm1x - beta(k) * qm2x;

      end

      t = 1.0 - x * x;
%
%  The basis function PHI = ( 1 - x^2 ) * q.
%
%     s = pp * ( phi(i) )' * ( phi(i) )' + qq * phi(i) * phi(i)
%
      s = pp ( x, problem ) * ( t * qx - 2.0 * x * q )^2 ...
        + qq ( x, problem ) * ( t * q )^2;
%
%     u = pp * ( x * phi(i) )' * phi(i)' + qq * x * phi(i) * phi(i)
%
      u = pp ( x, problem ) ...
        * ( x * t * qx + ( 1.0 - 3.0 * x * x ) * q ) ...
        * ( t * qx - 2.0 * x * q ) + x * qq ( x, problem ) * ( t * q )^2;
%
%     v = pp * ( x * phi(i) )' * phi(i-1) + qq * x * phi(i) * phi(i-1)
%
      v = pp ( x, problem ) ...
        * ( x * t * qx + ( 1.0 - 3.0 * x * x ) * q ) ...
        * ( t * qm1x - 2.0 * x * qm1 ) ...
        + x * qq ( x, problem ) * t * t * q * qm1;
%
%  SS(i) = <   phi(i), phi(i)   > = integral ( S )
%  SU(i) = < x phi(i), phi(i)   > = integral ( U )
%  SV(i) = < x phi(i), phi(i-1) > = integral ( V )
%
      ss = ss + s * quad_w(iq);
      su = su + u * quad_w(iq);
      sv = sv + v * quad_w(iq);

    end

    a(i) = ss;
%
%  ALPHA(i) = SU(i) / SS(i)
%  BETA(i)  = SV(i) / SS(i-1)
%
    if ( i <= np )
      alpha(i) = su / ss;
      beta(i) = sv / a(i-1);
    end

  end

  return
end
function exact ( alpha, beta, f, np, nprint, problem, quad_num, ...
  quad_w, quad_x )

%*****************************************************************************80
%
%% EXACT compares the computed and exact solutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Input, real F(1:NP+1).
%    F contains the basis function coefficients that form the
%    representation of the solution U.  That is,
%      U(X)  =  SUM (I=0 to NP) F(I+1) * BASIS(I)(X)
%    where "BASIS(I)(X)" means the I-th basis function
%    evaluated at the point X.
%
%    Input, integer NP.
%    The highest degree polynomial to use.
%
%    Input, integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out at the end of the computation.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Input, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Input, real QUAD_X(QUAD_NUM), the quadrature abscissas.
%
  nsub = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Comparison of computed and exact solutions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X        U computed    U exact     Difference\n' );
  fprintf ( 1, '\n' );

  for i = 0 : nprint
    x = ( 2 * i - nprint ) / nprint;
    ue = uex ( x, problem );
    up = 0.0;
    for j = 0 : np
      [ phii, phiix ] = phi ( alpha, beta, j, np, x );
      up = up + phii * f(j+1);
    end
    fprintf ( 1, '  %8f  %12f  %12f  %12f\n', x, up, ue, ue - up );
  end
%
%  Compute the big L2 error.
%
  big_l2 = 0.0;

  for i = 1 : nsub

    xl = ( 2 * i - nsub - 1 ) / nsub;
    xr = ( 2 * i - nsub     ) / nsub;

    for j = 1 : quad_num

      x = ( xl * ( 1.0 - quad_x(j) ) ...
          + xr * ( 1.0 + quad_x(j) ) ) / 2.0;

      up = 0.0;
      for k = 0 : np
        [ phii, phiix ] = phi ( alpha, beta, k, np, x );
        up = up + phii * f(k+1);
      end

      big_l2 = big_l2 + ( up - uex ( x, problem ) )^2 * quad_w(j) ...
        * ( xr - xl ) / 2.0;

    end

  end

  big_l2 = sqrt ( big_l2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Big L2 error = %f\n', big_l2 );

  return
end
function value = ff ( x, problem )

%*****************************************************************************80
%
%% FF evaluates the right hand side function F(X) at any point X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Output, real VALUE, the value of F(X).
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = 1.0 + 12.0 * x.^2 - x.^4;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = 0.25 * pi^2 * cos ( 0.5 * pi * x );

  end

  return
end
function ortho ( a, alpha, beta, np, problem, quad_num, quad_w, quad_x )

%*****************************************************************************80
%
%% ORTHO tests the basis functions for orthogonality.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real A(1:NP+1), the squares of the norms of the
%    basis functions.
%
%    Input, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Input, integer NP.
%    The highest degree polynomial to use.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Input, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Input, real QUAD_X(QUAD_NUM), the quadrature abscissas.
%

%
%  Zero out the B array, so we can start summing up the dot products.
%
  b(1:np+1,1:np+1) = 0.0;
%
%  Approximate the integral of the product of basis function
%  I and basis function J over the interval [-1,1].
%
%  We expect to get zero, except when I and J are equal,
%  when we should get A(I).
%
  for iq = 1 : quad_num
    x = quad_x(iq);
    for i = 0 : np
      [ phii, phiix ] = phi ( alpha, beta, i, np, x );
      for j = 0 : np

        [ phij, phijx ] = phi ( alpha, beta, j, np, x );

        bij = pp ( x, problem ) * phiix * phijx ...
            + qq ( x, problem ) * phii * phij;

        b(i+1,j+1) = b(i+1,j+1) + bij * quad_w(iq);

      end
    end
  end
%
%  Print out the results of the test.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Basis function orthogonality test:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   i   j     b(i,j)/a(i)\n' );
  fprintf ( 1, '\n' );
  for i = 0 : np
    fprintf ( 1, '\n' );
    for j = 0 : np
      fprintf ( 1, '  %4d  %4d  %12f\n', i, j, b(i+1,j+1) / a(i+1) );
    end
  end

  return
end
function [ phii, phiix ] = phi ( alpha, beta, i, np, x )

%*****************************************************************************80
%
%% PHI evaluates the I-th basis function at the point X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Input, integer I, the index of the basis function.
%
%    Input, integer NP, the highest degree polynomial to use.
%
%    Input, real X, the evaluation point.
%
%    Output, real PHII, PHIIX, the value of the basis
%    function and its derivative.
%
  if ( 0 )

  qm1 = 0.0;
  q = 1.0;
  for j = 1 : i
    qm2 = qm1;
    qm1 = q;
    q = ( x - alpha(j) ) * qm1 - beta(j) * qm2;
  end

  phii = ( 1.0 - x * x ) * q;

  qm1x = 0.0;
  qx = 0.0;
  for j = 1 : i
    qm2x = qm1x;
    qm1x = qx;
    qx = qm1 + ( x - alpha(j) ) * qm1x - beta(j) * qm2x;
  end

  phiix = ( 1.0 - x * x ) * qx - 2.0 * x * q;

  else

  qm1 = 0.0;
  q = 1.0;
  qm1x = 0.0;
  qx = 0.0;

  for j = 1 : i
    qm2 = qm1;
    qm1 = q;
    qm2x = qm1x;
    qm1x = qx;
    t = x - alpha(j);
    q = t * qm1 - beta(j) * qm2;
    qx = qm1 + t * qm1x - beta(j) * qm2x;
  end

  t = 1.0 - x * x;
  phii = t * q;
  phiix = t * qx - 2.0 * x * q;

  end

  return
end
function value = pp ( x, problem )

%*****************************************************************************80
%
%% PP returns the value of the coefficient function P(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Output, real VALUE, the value of P(X).
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = 1.0;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = 1.0;

  end

  return
end
function value = qq ( x, problem )

%*****************************************************************************80
%
%% QQ returns the value of the coefficient function Q(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Output, real VALUE, the value of Q(X).
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = 1.0;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = 0.0;

  end

  return
end
function [ quad_w, quad_x ] = quad ( quad_num )

%*****************************************************************************80
%
%% QUAD returns the abscissas and weights for gaussian quadrature on [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Output, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Output, real QUAD_X(QUAD_NUM), the quadrature abscissas.
%

%
%  Quadrature points
%
  quad_x(1:10) = [ ...
    -0.973906528517172; ...
    -0.865063366688985; ...
    -0.679409568299024; ...
    -0.433395394129247; ...
    -0.148874338981631; ...
     0.148874338981631; ...
     0.433395394129247; ...
     0.679409568299024; ...
     0.865063366688985; ...
     0.973906528517172 ];
%
%  Weights
%
  quad_w(1:10) = [...
     0.066671344308688; ...
     0.149451349150581; ...
     0.219086362515982; ...
     0.269266719309996; ...
     0.295524224714753; ...
     0.295524224714753; ...
     0.269266719309996; ...
     0.219086362515982; ...
     0.149451349150581; ...
     0.066671344308688 ];

  return
end
function r8vec_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_PRINT prints a real vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d: %12g\n', i, a(i) );
  end

  return
end
function f = sol ( a, alpha, beta, np, problem, quad_num, quad_w, quad_x )

%*****************************************************************************80
%
%% SOL solves a linear system for the finite element coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real A(1:NP+1), the squares of the norms of the
%    basis functions.
%
%    Input, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Input, integer NP.
%    The highest degree polynomial to use.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Input, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Input, real QUAD_X(QUAD_NUM), the quadrature abscissas.
%
%    Output, real F(1:NP+1).
%    F contains the basis function coefficients that form the
%    representation of the solution U.  That is,
%      U(X)  =  SUM (I=0 to NP) F(I+1) * BASIS(I)(X)
%    where "BASIS(I)(X)" means the I-th basis function
%    evaluated at the point X.
%
  f(1:np+1) = 0.0;

  for iq = 1 : quad_num
    x = quad_x(iq);
    t = ff ( x, problem ) * quad_w(iq);
    for i = 0 : np
      [ phii, phiix ] = phi ( alpha, beta, i, np, x );
      f(i+1) = f(i+1) + phii * t;
    end
  end

  f(1:np+1) = f(1:np+1) ./ a(1:np+1);

  return
end
function solution_print ( alpha, beta, f, np, nprint )

%*****************************************************************************80
%
%% SOLUTION_PRINT prints out the computed solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real ALPHA(NP), BETA(NP), the recurrence coefficients.
%    for the basis functions.
%
%    Input, real F(1:NP+1).
%    F contains the basis function coefficients that form the
%    representation of the solution U.  That is,
%      U(X)  =  SUM (I=0 to NP) F(I+1) * BASIS(I)(X)
%    where "BASIS(I)(X)" means the I-th basis function
%    evaluated at the point X.
%
%    Input, integer NP.
%    The highest degree polynomial to use.
%
%    Input, integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out at the end of the computation.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Representation of solution:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Basis function coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 0 : np
    fprintf ( 1, '  %4d  %12f\n', i, f(i+1) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X     Approximate Solution\n' );
  fprintf ( 1, '\n' );
  for ip = 0 : nprint
    x = ( 2 * ip - nprint ) / nprint;
    up = 0.0;
    for i = 0 : np
      [ phii, phiix ] = phi ( alpha, beta, i, np, x );
      up = up + phii * f(i+1);
    end
    fprintf ( 1, '  %12f  %12f\n', x, up );
  end

  fprintf ( 1, '\n' );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
function value = uex ( x, problem )

%*****************************************************************************80
%
%% UEX returns the value of the exact solution at a point X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by Max Gunzburger, Teresa Hodge
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates the problem being solved.
%    1, U=1-x^4, P=1, Q=1, F=1.0+12.0*x^2-x^4.
%    2, U=cos(0.5*pi*x), P=1, Q=0, F=0.25*pi*pi*cos(0.5*pi*x).
%
%    Output, real VALUE, the exact value of U(X).
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = 1.0 - x.^4;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = cos ( 0.5 * pi * x );

  end

  return
end

