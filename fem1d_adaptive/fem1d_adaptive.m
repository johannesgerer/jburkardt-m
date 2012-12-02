function fem1d_adaptive ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEM1D_ADAPTIVE.
%
%  Discussion:
%
%    FEM1D_ADAPTIVE solves a 1D problem using an adaptive finite element method.
%
%    The equation to be treated is:
%
%      -d/dx ( P(x) * dU(x)/dx ) + Q(x) * U(x)  =  F(x)
%
%    by the finite-element method using piecewise linear basis
%    functions.
%
%    An adaptive method is used to try to reduce the maximum
%    error by refining the mesh in certain places.
%
%    Here U is an unknown scalar function of X defined on the
%    interval [XL,XR], and P, Q and F are given functions of X.
%
%    The values of U at XL and XR are also specified.
%
%    The interval [XL,XR] is "meshed" with N+1 points,
%
%      XN(0) = XL, XN(1) = XL+H, XN(2) = XL+2*H, ..., XN(N) = XR.
%
%    This creates N subintervals, with interval I having endpoints 
%    XN(I-1) and XN(I).
%
%    The algorithm tries to guarantee a certain amount
%    of accuracy by examining the current solution, estimating the error
%    in each subinterval, and, if necessary, subdividing one or more
%    subintervals and repeating the calculation.
%
%    We can think of the adaptive part of the algorithm as a refined
%    problem.  The program re-solves the problem on the pair of
%    intervals J and J+1, which extend from node J-1 to node J+1.
%    The values of U that were just computed at nodes J-1 and J+1
%    will be used as the boundary values for this refined problem.
%    The intervals J and J+1 will each be evenly divided into NY
%    smaller subintervals.  This boundary value problem is solved,
%    and the derivatives of the original and refined solutions are
%    then compared to get an estimate of the error.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    real ADIAG(NU).
%    ADIAG(I) is the "diagonal" coefficient of the I-th
%    equation in the linear system.  That is, ADIAG(I) is
%    the coefficient of the I-th unknown in the I-th equation.
%
%    real ALEFT(NU).
%    ALEFT(I) is the "left hand" coefficient of the I-th
%    equation in the linear system.  That is, ALEFT(I) is the
%    coefficient of the (I-1)-th unknown in the I-th equation.
%    There is no value in ALEFT(1), since the first equation
%    does not refer to a "0-th" unknown.
%
%    real ARITE(NU).
%    ARITE(I) is the "right hand" coefficient of the I-th
%    equation in the linear system.  ARITE(I) is the coefficient
%    of the (I+1)-th unknown in the I-th equation.  There is
%    no value in ARITE(NU) because the NU-th equation does not
%    refer to an "NU+1"-th unknown.
%
%    real ETA(N).
%    ETA(I) is the error estimate for interval I.  It is computed
%    as the sum of two quantities, one associated with the left
%    and one with the right node of the interval.
%
%    real F(NU).
%    ASSEMBLE stores into F the right hand side of the linear
%    equations.
%    SOLVE replaces those values of F by the solution of the
%    linear equations.
%
%    real FY(M).
%    FY is the right hand side of the linear system of the refined
%    problem.
%
%    real H(N)
%    H(I) is the length of subinterval I.  This code uses
%    equal spacing for all the subintervals.
%
%    real HY(M).
%    HY(I) is the length of subinterval I in the refined problem.
%
%    integer IBC.
%    IBC declares what the boundary conditions are.
%    1, at the left endpoint, U has the value UL,
%       at the right endpoint, U' has the value UR.
%    2, at the left endpoint, U' has the value UL,
%       at the right endpoint, U has the value UR.
%    3, at the left endpoint, U has the value UL,
%       and at the right endpoint, U has the value UR.
%    4, at the left endpoint, U' has the value UL,
%       at the right endpoint U' has the value UR.
%
%    integer IBCY.
%    IBCY declares the boundary conditions for the refined problem
%    which should always be that the value of U is specified at
%    both the left and right endpoints.  This corresponds to a
%    value of IBCY = 3.
%
%    integer INDX(0:N).
%    For a node I, INDX(I) is the index of the unknown
%    associated with node I.
%    If INDX(I) is equal to -1, then no unknown is associated
%    with the node, because a boundary condition fixing the
%    value of U has been applied at the node instead.
%    Unknowns are numbered beginning with 1.
%    If IBC is 2 or 4, then there is an unknown value of U
%    at node 0, which will be unknown number 1.  Otherwise,
%    unknown number 1 will be associated with node 1.
%    If IBC is 1 or 4, then there is an unknown value of U
%    at node N, which will be unknown N or N+1,
%    depending on whether there was an unknown at node 0.
%
%    integer INDY(0:M).
%    INDY(I) records the index of the unknown associated with
%    node I for the refined problem.
%
%    integer JADD(N).
%    JADD(I) is 1 if the error estimates show that interval I
%    should be subdivided.
%
%    integer KOUNT, the number of adaptive steps that have been taken.
%
%    integer M.
%    M is the number of subintervals used in the refined problem.
%    M is equal to NY for computations centered at node 0 or node N,
%    and otherwise, M is equal to 2*NY.
%
%    integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    integer NMAX, the maximum number of unknowns that can be handled.
%
%    integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    integer NODEY(NL,M).
%    NODEY performs the same function for the refined problem that
%    NODE performs for the full problem, recording the node numbers
%    associated with a particular subinterval.
%
%    integer NQUAD
%    The number of quadrature points used in a subinterval.
%
%    integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    integer NUY.
%    The number of unknowns in the refined problem.
%
%    integer NY.
%    NY is the number of subintervals into which a given interval
%    will be subdivided, before solving the refined probelm.
%
%    integer PROBLEM, chooses the problem to be solved.
%    The user must choose this value by setting it in routine GETPRB.
%    * 1, u = x, p = 1, q = 0, f = 0, ibc = 3, ul = 0, ur = 1.
%    The program should find the solution exactly, and the
%    adaptive code should find that there is no reason to
%    subdivide any interval.
%    * 2, u = x*x, p = 1, q = 0, f = -2, ibc = 3, ul = 0, ur = 1.
%    This problem should find the solution exactly, and
%    the adaptive code should again find there is nothing
%    to do.
%    *3, u = sin(pi*x/2), p = 1, q = 0, ibc = 3, f = 0.25*pi*pi*sin(pi*x/2), 
%    ul = 0, ur = 1.
%    *4, u = cos(pi*x/2), p = 1, q = 0, ibc = 3, f = 0.25*pi*pi*cos(pi*x/2), 
%    ul = 1, ur = 0.
%    *5: u = x**(beta+2)/((beta+2)*(beta+1)), p = 1, q = 1, ibc = 3, 
%    f = -x**beta + (x**(beta+2))/((beta+2)*(beta+1)),
%    ul = 0, ur = 1/((beta+2)*(beta+1))
%    (beta must be greater than -2, and not equal to -1)
%    *6: u = atan((x-0.5)/alpha), p = 1, q = 0, ibc = 3, 
%    f =  2*alpha*(x-0.5) / (alpha^2 + (x-0.5)^2) ^2,
%    ul = u(0), ur = u(1)
%
%    integer STATUS, reports status of subdivision.
%    0, a new subdivision was carried out.
%    1, no more subdivisions are needed.
%    -1, no more subdivisions can be carried out.
%
%    real TOL.
%    A tolerance that is used to determine whether the estimated
%    error in an interval is so large that it should be subdivided
%    and the problem solved again.
%
%    real UL.
%    If IBC is 1 or 3, UL is the value that U is required
%    to have at X = XL.
%    If IBC is 2 or 4, UL is the value that U' is required
%    to have at X = XL.
%
%    real UR.
%    If IBC is 2 or 3, UR is the value that U is required
%    to have at X = XR.
%    If IBC is 1 or 4, UR is the value that U' is required
%    to have at X = XR.
%
%    real WQUAD(NQUAD).
%    WQUAD(I) is the weight associated with the I-th point
%    of an NQUAD point Gaussian quadrature rule.
%
%    real XL.
%    XL is the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    real XQUAD(NQUAD,NMAX), the I-th quadrature point
%    in interval J.
%
%    real XQUADY(NQUAD,NMAY ), the I-th quadrature point
%    in subinterval J of the refined problem.
%
%    real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
%    Workspace, double precision XT(0:NMAX), used to compute a new
%    set of nodes.
%
%    real YN(0:M).
%    YN(I) is the location of the I-th node in the refined
%    problem.
%
  nl = 2;
  nmax = 30;
  nquad = 2;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_ADAPTIVE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Solve the two-point boundary value problem:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  -d/dx ( P(x) * dU(x)/dx ) + Q(x) * U(x)  =  F(x)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'on the interval [0,1], specifying the value\n' );
  fprintf ( 1, 'of U at each endpoint.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'The number of basis functions per element is %d\n', nl );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'The number of quadrature points per element is %d\n', nquad );

  problem = get_problem ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem index = %d\n', problem );
  fprintf ( 1, '\n' );

  if ( problem == 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  "Linear" problem:\n' );
    fprintf ( 1, '  (No refinement needed)\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(X) =  X\n' );
    fprintf ( 1, '  P(X) =  1.0\n' );
    fprintf ( 1, '  Q(X) =  0.0\n' );
    fprintf ( 1, '  F(X) =  0.0\n' );
    fprintf ( 1, '  IBC  =  3\n' );
    fprintf ( 1, '  UL   =  0.0\n' );
    fprintf ( 1, '  UR   =  1.0\n' );

  elseif ( problem == 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  "Quadratic" problem:\n' );
    fprintf ( 1, '  (No refinement needed)\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(X) =  X*X\n' );
    fprintf ( 1, '  P(X) =  1.0\n' );
    fprintf ( 1, '  Q(X) =  0.0\n' );
    fprintf ( 1, '  F(X) = -2.0\n' );
    fprintf ( 1, '  IBC  =  3\n' );
    fprintf ( 1, '  UL   =  0.0\n' );
    fprintf ( 1, '  UR   =  1.0\n' );

  elseif ( problem == 3 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  "SINE" problem:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(X) =  SIN(PI*X/2)\n' );
    fprintf ( 1, '  P(X) =  1.0\n' );
    fprintf ( 1, '  Q(X) =  0.0\n' );
    fprintf ( 1, '  F(X) =  PI*PI*SIN(PI*X/2)/4\n' );
    fprintf ( 1, '  IBC  =  3\n' );
    fprintf ( 1, '  UL   =  0.0\n' );
    fprintf ( 1, '  UR   =  1.0\n' );

  elseif ( problem == 4 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  "COSINE" problem:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(X) =  COS(PI*X/2)\n' );
    fprintf ( 1, '  P(X) =  1.0\n' );
    fprintf ( 1, '  Q(X) =  0.0\n' );
    fprintf ( 1, '  F(X) =  PI*PI*COS(PI*X/2)/4\n' );
    fprintf ( 1, '  IBC  =  3\n' );
    fprintf ( 1, '  UL   =  0.0\n' );
    fprintf ( 1, '  UR   =  1.0\n' );

  elseif ( problem == 5 )

    beta = get_beta ( );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  "RHEINBOLDT" problem:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(X) =  X**(B+2)/((B+2)*(B+1))\n' );
    fprintf ( 1, '  P(X) =  1.0\n' );
    fprintf ( 1, '  Q(X) =  1.0\n' );
    fprintf ( 1, '  F(X) =  -X**B+(X**B+2))/((B+2)*(B+1))\n' );
    fprintf ( 1, '  IBC  =  3\n' );
    fprintf ( 1, '  UL   =  0.0\n' );
    fprintf ( 1, '  UR   =  1/((B+2)*(B+1))\n' );
    fprintf ( 1, '  B    = %f\n', beta );

  elseif ( problem == 6 )

    alpha = get_alpha ( );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  "ARCTAN" problem:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(X) =  ATAN((X-0.5)/A)\n' );
    fprintf ( 1, '  P(X) =  1.0\n' );
    fprintf ( 1, '  Q(X) =  0.0\n' );
    fprintf ( 1, '  F(X) =  2*A*(X-0.5)/(A^2+(X-0.5)^2)^2\n' );
    fprintf ( 1, '  IBC  =  3\n' );
    fprintf ( 1, '  UL   =  ATAN(-0.5/A)\n' );
    fprintf ( 1, '  UR   =  ATAN( 0.5/A)\n' );
    fprintf ( 1, '  A    = %f\n', alpha );

  end
%
%  Start out with just 4 subintervals.
%
  n = 4;
%
%  Initialize values that define the problem.
%
  [ ibc, tol, ul, ur, xl, xn, xr ] = init ( n );
%
%  Start the iteration counter off at 0.
%
  kount = 0;
%
%  Begin the next iteration.
%
  while ( 1 )

    kount = kount + 1;

    fprintf ( 1, '\n' );
    fprintf ( 1, 'Begin new iteration with %d nodes.\n', n );
    fprintf ( 1, '\n' );
%
%  Solve the regular problem.
%
    [ u, h, nu ] = solvex ( ibc, kount, n, nl, nmax, ul, ur, xn );
%
%  Solve N subproblems to get the error estimators.
%
    eta = solvey ( u, h, n, nu, ul, ur, xn );
%
%  Examine the error estimators, and see how many intervals should
%  be subdivided.
%
    [ n, xn, status ] = subdiv ( eta, kount, n, nmax, tol, xn );

    if ( status ~= 0 )
      break
    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_ADAPTIVE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function [ adiag, aleft, arite, f ] = assemble ( h, n, indx, node, nu, nl, ...
  nquad, nmax, ul, ur, wquad, xn, xquad )

%*****************************************************************************80
%
%% ASSEMBLE assembles the global matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real H(N)
%    H(I) is the length of subinterval I.  This code uses
%    equal spacing for all the subintervals.
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer INDX(0:N).
%    For a node I, INDX(I) is the index of the unknown
%    associated with node I.
%    If INDX(I) is equal to -1, then no unknown is associated
%    with the node, because a boundary condition fixing the
%    value of U has been applied at the node instead.
%    Unknowns are numbered beginning with 1.
%    If IBC is 2 or 4, then there is an unknown value of U
%    at node 0, which will be unknown number 1.  Otherwise,
%    unknown number 1 will be associated with node 1.
%    If IBC is 1 or 4, then there is an unknown value of U
%    at node N, which will be unknown N or N+1,
%    depending on whether there was an unknown at node 0.
%
%    Input, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NQUAD
%    The number of quadrature points used in a subinterval.
%
%    Input, integer NMAX, the maximum number of unknowns that can be handled.
%
%    Input, real UL.
%    If IBC is 1 or 3, UL is the value that U is required
%    to have at X = XL.
%    If IBC is 2 or 4, UL is the value that U' is required
%    to have at X = XL.
%
%    Input, real UR.
%    If IBC is 2 or 3, UR is the value that U is required
%    to have at X = XR.
%    If IBC is 1 or 4, UR is the value that U' is required
%    to have at X = XR.
%
%    Input, real WQUAD(NQUAD).
%    WQUAD(I) is the weight associated with the I-th point
%    of an NQUAD point Gaussian quadrature rule.
%
%    Input, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    Input, real XQUAD(NQUAD,NMAX), the I-th quadrature point
%    in interval J.
%
%    Output, real ADIAG(NU).
%    ADIAG(I) is the "diagonal" coefficient of the I-th
%    equation in the linear system.  That is, ADIAG(I) is
%    the coefficient of the I-th unknown in the I-th equation.
%
%    Output, real ALEFT(NU).
%    ALEFT(I) is the "left hand" coefficient of the I-th
%    equation in the linear system.  That is, ALEFT(I) is the
%    coefficient of the (I-1)-th unknown in the I-th equation.
%    There is no value in ALEFT(1), since the first equation
%    does not refer to a "0-th" unknown.
%
%    Output, real ARITE(NU).
%    ARITE(I) is the "right hand" coefficient of the I-th
%    equation in the linear system.  ARITE(I) is the coefficient
%    of the (I+1)-th unknown in the I-th equation.  There is
%    no value in ARITE(NU) because the NU-th equation does not
%    refer to an "NU+1"-th unknown.
%
%    Output, real F(NU).
%    ASSEMBLE stores into F the right hand side of the linear
%    equations.
%    SOLVE replaces those values of F by the solution of the
%    linear equations.
%

%
%  Zero out the entries.
%
  f(1:nu) = 0.0;
  aleft(1:nu) = 0.0;
  arite(1:nu) = 0.0;
  adiag(1:nu) = 0.0;
%
%  For each interval,
%
  for ie = 1 : n

    he = h(ie);
    xleft = xn(node(1,ie)+1);
    xrite = xn(node(2,ie)+1);
%
%  For each quadrature point in the interval,
%
    for iq = 1 : nquad

      xquade = xquad(iq,ie);
      wquade = wquad(iq);
%
%  Pick a basis function which defines the equation,
%
      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( 0 < iu )

          [ phii, phiix ] = phi ( il, xquade, xleft, xrite );
          f(iu) = f(iu) + he * wquade * ff ( xquade ) * phii;
%
%  Take care of boundary conditions specifying the value of U'.
%
          if ( ig == 0 )
            x = 0.0;
            f(iu) = f(iu) - pp ( x ) * ul;
          elseif ( ig == n )
            x = 1.0;
            f(iu) = f(iu) + pp ( x ) * ur;
          end
%
%  Pick a basis function which defines the coefficient
%  being computed.
%
          for jl = 1 : nl

            jg = node(jl,ie);
            ju = indx(jg+1);
            [ phij, phijx ] = phi ( jl, xquade, xleft, xrite );

            aij = he * wquade * ...
               ( pp ( xquade ) * phiix * phijx ...
               + qq ( xquade ) * phii * phij );
%
%  Decide where the coefficient is to be added.
%
            if ( ju <= 0 )
 
              if ( jg == 0 )
                f(iu) = f(iu) - aij * ul;
              elseif ( jg == n )
                f(iu) = f(iu) - aij * ur;
              end

            elseif ( iu == ju )
              adiag(iu) = adiag(iu) + aij;
            elseif ( ju < iu )
              aleft(iu) = aleft(iu) + aij;
            else
              arite(iu) = arite(iu) + aij;
            end

          end
        end
      end
    end
  end

  return
end
function value = ff ( x )

%*****************************************************************************80
%
%% FF evaluates the function F in the differential equation.
%
%  Discussion:
%
%    This is the function F(X) that appears on the right hand
%    side of the equation:
%
%      -d/dx ( P(x) * dU(x)/dx ) + Q(x) * U(x)  =  F(x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of F(X).
%

%
%  Find out which problem we're working on.
%
  problem = get_problem ( );

  if ( problem == 1 )

    value = 0.0;

  elseif ( problem == 2 )

    value = -2.0 * x;

  elseif ( problem == 3 )

    value = 0.25 * pi^2 * sin ( 0.5 * pi * x );

  elseif ( problem == 4 )

    value = 0.25 * pi^2 * cos ( 0.5 * pi * x );

  elseif ( problem == 5 )

    beta = get_beta ( );

    value = - ( x^beta ) + ( x^( beta + 2.0 ) ) ...
      / ( ( beta + 2.0 ) * ( beta + 1.0 ) );

  elseif ( problem == 6 )

    alpha = get_alpha ( );

    value = 2.0 * alpha * ( x - 0.5 ) ...
      / ( alpha^2 + ( x - 0.5 )^2 )^2;

  end

  return
end
function [ h, indx, node, nu, wquad, xquad ] = geometry ( ibc, n, nl, nmax, ...
  nquad, xn )

%*****************************************************************************80
%
%% GEOMETRY sets up some of the geometric information for the problem.  
%
%  Discussion:
%
%    Note, however, that the location of the nodes
%    is done outside of this routine, and, in fact, before this
%    routine is called.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer IBC.
%    IBC declares what the boundary conditions are.
%    1, at the left endpoint, U has the value UL,
%       at the right endpoint, U' has the value UR.
%    2, at the left endpoint, U' has the value UL,
%       at the right endpoint, U has the value UR.
%    3, at the left endpoint, U has the value UL,
%       and at the right endpoint, U has the value UR.
%    4, at the left endpoint, U' has the value UL,
%       at the right endpoint U' has the value UR.
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NMAX, the maximum number of unknowns that can be handled.
%
%    Input, integer NQUAD
%    The number of quadrature points used in a subinterval.
%
%    Input, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    Output, real H(N)
%    H(I) is the length of subinterval I.  This code uses
%    equal spacing for all the subintervals.
%
%    Output, integer INDX(0:N).
%    For a node I, INDX(I) is the index of the unknown
%    associated with node I.
%    If INDX(I) is equal to -1, then no unknown is associated
%    with the node, because a boundary condition fixing the
%    value of U has been applied at the node instead.
%    Unknowns are numbered beginning with 1.
%    If IBC is 2 or 4, then there is an unknown value of U
%    at node 0, which will be unknown number 1.  Otherwise,
%    unknown number 1 will be associated with node 1.
%    If IBC is 1 or 4, then there is an unknown value of U
%    at node N, which will be unknown N or N+1,
%    depending on whether there was an unknown at node 0.
%
%    Output, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Output, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Output, real WQUAD(NQUAD).
%    WQUAD(I) is the weight associated with the I-th point
%    of an NQUAD point Gaussian quadrature rule.
%
%    Output, real XQUAD(NQUAD,NMAX), the I-th quadrature point
%    in interval J.
%

%
%  Store in NODE the fact that interval I has node I-1
%  as its left endpoint, and node I as its right endpoint.
%
  for i = 1 : n
    node(1,i) = i-1;
    node(2,i) = i;
  end
%
%  For every node that is associated with an unknown, we
%  record the number of the unknown in INDX.
%
  nu = 0;

  for i = 0 : n

    if ( i == 0 & ( ibc == 1 | ibc == 3 ) )
      indx(i+1) = -1;
    elseif ( i == n & ( ibc == 2 | ibc == 3 ) )
      indx(i+1) = -1;
    else
      nu = nu + 1;
      indx(i+1) = nu;
    end

  end
%
%  We compute the width of each interval.
%
  for i = 1 : n
    igl = node(1,i);
    igr = node(2,i);
    h(i) = xn(igr+1) - xn(igl+1);
  end
%
%  We compute the location of the quadrature points in each
%  interval.
%
  for i = 1 : n

    xl = xn(node(1,i)+1);
    xr = xn(node(2,i)+1);

    if ( nquad == 1 )
      xquad(1,i) = 0.5 * ( xl + xr );
    elseif ( nquad == 2 )
      alfa = -0.577350;
      xquad(1,i) = ( ( 1.0 - alfa ) * xl   ...
                   + ( 1.0 + alfa ) * xr ) ...
                   /   2.0;
      alfa = +0.577350;
      xquad(2,i) = ( ( 1.0 - alfa ) * xl   ...
                   + ( 1.0 + alfa ) * xr ) ...
                   /   2.0;
    elseif ( nquad == 3 )
      alfa = -0.774597;
      xquad(1,i) = ( ( 1.0 - alfa ) * xl   ...
                   + ( 1.0 + alfa ) * xr ) ...
                   /   2.0;
      xquad(2,i) = 0.5 * ( xl + xr );
      alfa = +0.774597;
      xquad(3,i) = ( ( 1.0 - alfa ) * xl   ...
                   + ( 1.0 + alfa ) * xr ) ...
                   /   2.0;
    end

  end
%
%  Store the weights for the quadrature rule.
%
  if ( nquad == 1 )
    wquad(1) = 1.0;
  elseif ( nquad == 2 )
    wquad(1) = 0.5;
    wquad(2) = 0.5;
  elseif ( nquad == 3 )
    wquad(1) = 4.0 / 9.0;
    wquad(2) = 5.0 / 18.0;
    wquad(3) = 4.0 / 9.0;
  end

  return
end
function alpha = get_alpha ( )

%*****************************************************************************80
%
%% GET_ALPHA returns the value of ALPHA, for use by problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Output, real ALPHA, the value of ALPHA.
%
  alpha = 0.01;

  return
end
subroutine beta = get_beta ( )

%*****************************************************************************80
%
%% GET_BETA returns the value of BETA, for use by problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Output, real BETA, the value of BETA.
%
  beta = -0.9;

  return
end
function problem = get_problem ( )

%*****************************************************************************80
%
%% GETPRB returns the value of the current problem number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Output, integer PROBLEM, the index of the problem.
%
  problem = 6;

  return
end
function [ ibc, tol, ul, ur, xl, xn, xr ] = init ( n )

%*****************************************************************************80
%
%% INIT initializes some parameters that define the problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Output, integer IBC.
%    IBC declares what the boundary conditions are.
%    1, at the left endpoint, U has the value UL,
%       at the right endpoint, U' has the value UR.
%    2, at the left endpoint, U' has the value UL,
%       at the right endpoint, U has the value UR.
%    3, at the left endpoint, U has the value UL,
%       and at the right endpoint, U has the value UR.
%    4, at the left endpoint, U' has the value UL,
%       at the right endpoint U' has the value UR.
%
%    Output, real TOL.
%    A tolerance that is used to determine whether the estimated
%    error in an interval is so large that it should be subdivided
%    and the problem solved again.
%
%    Output, real UL.
%    If IBC is 1 or 3, UL is the value that U is required
%    to have at X = XL.
%    If IBC is 2 or 4, UL is the value that U' is required
%    to have at X = XL.
%
%    Output, real UR.
%    If IBC is 2 or 3, UR is the value that U is required
%    to have at X = XR.
%    If IBC is 1 or 4, UR is the value that U' is required
%    to have at X = XR.
%
%    Output, real XL.
%    XL is the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    Output, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    Output, real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
  tol = 0.01;
%
%  Find out which problem we're working on.
%
  problem = get_problem ( );
%
%  Set the boundary conditions for the problem, and
%  print out its title.
%
  if ( problem == 1 )

    ibc = 3;
    ul = 0.0;
    ur = 1.0;
    xl = 0.0;
    xr = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Exact solution is U = X\n' );

  elseif ( problem == 2 )

    ibc = 3;
    ul = 0.0;
    ur = 1.0;
    xl = 0.0;
    xr = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Exact solution is U = X*X\n' );

  elseif ( problem == 3 )

    ibc = 3;
    ul = 0.0;
    ur = 1.0;
    xl = 0.0;
    xr = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Exact solution is U = SIN(PI*X/2)\n' );

  elseif ( problem == 4 )

    ibc = 3;
    ul = 1.0;
    ur = 0.0;
    xl = 0.0;
    xr = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Exact solution is U = COS(PI*X/2)\n' );

  elseif ( problem == 5 )

    ibc = 3;
    beta = get_beta ( 'DUMMY' );
    ul = 0.0;
    ur = 1.0 / ( ( beta + 2.0 ) * ( beta + 1.0 ) );
    xl = 0.0;
    xr = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Rheinboldt problem\n' );

  elseif ( problem == 6 )

    ibc = 3;
    alpha = get_alpha ( );
    xl = 0.0;
    xr = 1.0;
    ul = uexact ( xl );
    ur = uexact ( xr );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Arctangent problem\n' );

  end
%
%  The nodes are defined here, and not in the geometry routine.
%  This is because each new iteration chooses the location
%  of the new nodes in a special way.
%
  for i = 0 : n
    xn(i+1) = ( ( n - i ) * xl   ...
              + (     i ) * xr ) ...
              / ( n     );
  end

  fprintf ( 1, 'The equation is to be solved for\n' );
  fprintf ( 1, 'X greater than %f\n', xl );
  fprintf ( 1, ' and less than %f\n', xr );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'The boundary conditions are:\n' );
  fprintf ( 1, '\n' );

  if ( ibc == 1 | ibc == 3 )
    fprintf ( 1, '  At X = XL, U = %f\n', ul );
  else
    fprintf ( 1, '  At X = XL, U'' = %f\n', ul );
  end

  if ( ibc == 2 | ibc == 3 )
    fprintf ( 1, '  At X = XR, U = %f\n', ur );
  else
    fprintf ( 1, '  At X = XR, U'' %f\n= ', ur );
  end

  return
end
function output ( f, ibc, indx, n, nu, ul, ur, xn )

%*****************************************************************************80
%
%% OUTPUT prints out the computed solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real F(NU).
%    ASSEMBLE stores into F the right hand side of the linear
%    equations.
%    SOLVE replaces those values of F by the solution of the
%    linear equations.
%
%    Input, integer IBC.
%    IBC declares what the boundary conditions are.
%    1, at the left endpoint, U has the value UL,
%       at the right endpoint, U' has the value UR.
%    2, at the left endpoint, U' has the value UL,
%       at the right endpoint, U has the value UR.
%    3, at the left endpoint, U has the value UL,
%       and at the right endpoint, U has the value UR.
%    4, at the left endpoint, U' has the value UL,
%       at the right endpoint U' has the value UR.
%
%    Input, integer INDX(0:N).
%    For a node I, INDX(I) is the index of the unknown
%    associated with node I.
%    If INDX(I) is equal to -1, then no unknown is associated
%    with the node, because a boundary condition fixing the
%    value of U has been applied at the node instead.
%    Unknowns are numbered beginning with 1.
%    If IBC is 2 or 4, then there is an unknown value of U
%    at node 0, which will be unknown number 1.  Otherwise,
%    unknown number 1 will be associated with node 1.
%    If IBC is 1 or 4, then there is an unknown value of U
%    at node N, which will be unknown N or N+1,
%    depending on whether there was an unknown at node 0.
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, real UL.
%    If IBC is 1 or 3, UL is the value that U is required
%    to have at X = XL.
%    If IBC is 2 or 4, UL is the value that U' is required
%    to have at X = XL.
%
%    Input, real UR.
%    If IBC is 2 or 3, UR is the value that U is required
%    to have at X = XR.
%    If IBC is 1 or 4, UR is the value that U' is required
%    to have at X = XR.
%
%    Input, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Node    X(I)        U(X(I))        Uexact        Error\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n

    if ( i == 0 )

      if ( ibc == 1 | ibc == 3 )
        u = ul;
      else
        u = f(indx(i+1));
      end

    elseif ( i == n )

      if ( ibc == 2 | ibc == 3 )
        u = ur;
      else
        u = f(indx(i+1));
      end

    else

      u = f(indx(i+1));

    end

    uex = uexact ( xn(i+1) );
    error = u - uex;

    fprintf ( 1, '  %4d  %12f  %12f  %12f  %12f\n', i, xn(i+1), u, uex, error );

  end

  return
end
function [ phii, phiix ] = phi ( il, x, xleft, xrite )

%*****************************************************************************80
%
%% PHI evaluates a linear basis function and its derivative.
%
%  Discussion:
%
%    The functions are evaluated at a point X in an interval.  In any
%    interval, there are just two basis functions.  The first
%    basis function is a line which is 1 at the left endpoint
%    and 0 at the right.  The second basis function is 0 at
%    the left endpoint and 1 at the right.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer IL, the local index of the basis function.
%
%    Input, real X, the evaluation point.
%
%    Input, real XLEFT, XRITE, the endpoints of the interval.
%
%    Output, real PHII, PHIIX, the value of the basis function
%    and its derivative.
%
  if ( xleft <= x & x <= xrite )

    if ( il == 1 )
      phii = ( xrite - x ) / ( xrite - xleft );
      phiix = -1.0 / ( xrite - xleft );
    else
      phii = ( x - xleft ) / ( xrite - xleft );
      phiix = 1.0 / ( xrite - xleft );
    end
%
%  If X is outside of the interval, then the basis function
%  is always zero.
%
  else
    phii = 0.0;
    phiix = 0.0;
  end

  return
end
function value = pp ( x )

%*****************************************************************************80
%
%% PP evaluates the function P in the differential equation.
%
%  Discussion:
%
%    The function P(X) occurs in the differential equation:
%
%      -d/dx ( P(x) * dU(x)/dx ) + Q(x) * U(x)  =  F(x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of P(X).
%

%
%  Find out which problem we're working on.
%
  problem = get_problem ( );

  if ( problem == 1 )
    value = 1.0;
  elseif ( problem == 2 )
    value = 1.0;
  elseif ( problem == 3 )
    value = 1.0;
  elseif ( problem == 4 )
    value = 1.0;
  elseif ( problem == 5 )
    value = 1.0;
  elseif ( problem == 6 )
    value = 1.0;
  end

  return
end
function prsys ( adiag, aleft, arite, f, nu )

%*****************************************************************************80
%
%% PRSYS prints out the tridiagonal linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ADIAG(NU).
%    ADIAG(I) is the "diagonal" coefficient of the I-th
%    equation in the linear system.  That is, ADIAG(I) is
%    the coefficient of the I-th unknown in the I-th equation.
%
%    Input, real ALEFT(NU).
%    ALEFT(I) is the "left hand" coefficient of the I-th
%    equation in the linear system.  That is, ALEFT(I) is the
%    coefficient of the (I-1)-th unknown in the I-th equation.
%    There is no value in ALEFT(1), since the first equation
%    does not refer to a "0-th" unknown.
%
%    Input, real ARITE(NU).
%    ARITE(I) is the "right hand" coefficient of the I-th
%    equation in the linear system.  ARITE(I) is the coefficient
%    of the (I+1)-th unknown in the I-th equation.  There is
%    no value in ARITE(NU) because the NU-th equation does not
%    refer to an "NU+1"-th unknown.
%
%    Input, real F(NU).
%    ASSEMBLE stores into F the right hand side of the linear
%    equations.
%    SOLVE replaces those values of F by the solution of the
%    linear equations.
%
%    integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Printout of tridiagonal linear system:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Equation  A-Left  A-Diag  A-Rite  RHS\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nu
    if ( i == 1 )
      fprintf ( 1, '%3d                %12f  %12f  %12f\n', ...
        i, adiag(i), arite(i), f(i) );
    elseif ( i < nu )
      fprintf ( 1, '%3d  %12f  %12f  %12f  %12f\n', ...
        i, aleft(i), adiag(i), arite(i), f(i) );
    else
      fprintf ( 1, '%3d  %12f  %12f                %12f\n', ...
        i, aleft(i), adiag(i), f(i) );
    end
  end

  return
end
function value = qq ( x )

%*****************************************************************************80
%
%% QQ evaluates the function Q in the differential equation.
%
%  Discussion:
%
%    The function Q(X) occurs in the differential equation:
%
%      -d/dx ( P(x) * dU(x)/dx ) + Q(x) * U(x)  =  F(x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of Q(X).
%

%
%  Find out which problem we're working on.
%
  problem = get_problem ( );

  if ( problem == 1 )
    value = 0.0;
  elseif ( problem == 2 )
    value = 0.0;
  elseif ( problem == 3 )
    value = 0.0;
  elseif ( problem == 4 )
    value = 0.0;
  elseif ( problem == 5 )
    value = 1.0;
  elseif ( problem == 6 )
    value = 0.0;
  end

  return
end
function u = solve ( adiag, aleft, arite, f, nu )

%*****************************************************************************80
%
%% SOLVE solves a tridiagonal matrix system of the form A*x = b.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ADIAG(NU), ALEFT(NU), ARITE(NU).
%    the diagonal, left and right entries of the equations.
%
%    Input, real F(NU), the right hand side of the linear system.
%
%    Input, INTEGER NU, the number of equations to be solved.
%
%    Output, real U(NU), the solution of the linear system.
%

%
%  Handle the special case of a single equation.
%
  if ( nu == 1 )

    u(1) = f(1) / adiag(1);
%
%  The general case, when NU is greater than 1.
%
  else

    arite(1) = arite(1) / adiag(1);
    for i = 2 : nu-1
      adiag(i) = adiag(i) - aleft(i) * arite(i-1);
      arite(i) = arite(i) / adiag(i);
    end
    adiag(nu) = adiag(nu) - aleft(nu) * arite(nu-1);

    u(1) = f(1) / adiag(1);
    for i = 2 : nu
      u(i) = ( f(i) - aleft(i) * u(i-1) ) / adiag(i);
    end

    for i = nu-1 : -1 : 1
      u(i) = u(i) - arite(i) * u(i+1);
    end

  end

  return
end
function [ u, h, nu ] = solvex ( ibc, kount, n, nl, nmax, ul, ur, xn )

%*****************************************************************************80
%
%% SOLVEX discretizes and solves a differential equation given the nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer IBC.
%    IBC declares what the boundary conditions are.
%    1, at the left endpoint, U has the value UL,
%       at the right endpoint, U' has the value UR.
%    2, at the left endpoint, U' has the value UL,
%       at the right endpoint, U has the value UR.
%    3, at the left endpoint, U has the value UL,
%       and at the right endpoint, U has the value UR.
%    4, at the left endpoint, U' has the value UL,
%       at the right endpoint U' has the value UR.
%
%    Input, integer KOUNT, the number of adaptive steps that have been taken.
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NMAX, the maximum number of unknowns that can be handled.
%
%    Input, real UL.
%    If IBC is 1 or 3, UL is the value that U is required
%    to have at X = XL.
%    If IBC is 2 or 4, UL is the value that U' is required
%    to have at X = XL.
%
%    Input, real UR.
%    If IBC is 2 or 3, UR is the value that U is required
%    to have at X = XR.
%    If IBC is 1 or 4, UR is the value that U' is required
%    to have at X = XR.
%
%    Input, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    Output, real U(NU), the finite element coefficients of the
%    solution of the differential equation.
%
%    Output, real H(N)
%    H(I) is the length of subinterval I.  This code uses
%    equal spacing for all the subintervals.
%
%    Output, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%  Local parameters:
%
%    Local, real ADIAG(NU).
%    ADIAG(I) is the "diagonal" coefficient of the I-th
%    equation in the linear system.  That is, ADIAG(I) is
%    the coefficient of the I-th unknown in the I-th equation.
%
%    Local, real ALEFT(NU).
%    ALEFT(I) is the "left hand" coefficient of the I-th
%    equation in the linear system.  That is, ALEFT(I) is the
%    coefficient of the (I-1)-th unknown in the I-th equation.
%    There is no value in ALEFT(1), since the first equation
%    does not refer to a "0-th" unknown.
%
%    Local, real ARITE(NU).
%    ARITE(I) is the "right hand" coefficient of the I-th
%    equation in the linear system.  ARITE(I) is the coefficient
%    of the (I+1)-th unknown in the I-th equation.  There is
%    no value in ARITE(NU) because the NU-th equation does not
%    refer to an "NU+1"-th unknown.
%
%    Local, integer INDX(0:N).
%    For a node I, INDX(I) is the index of the unknown
%    associated with node I.
%    If INDX(I) is equal to -1, then no unknown is associated
%    with the node, because a boundary condition fixing the
%    value of U has been applied at the node instead.
%    Unknowns are numbered beginning with 1.
%    If IBC is 2 or 4, then there is an unknown value of U
%    at node 0, which will be unknown number 1.  Otherwise,
%    unknown number 1 will be associated with node 1.
%    If IBC is 1 or 4, then there is an unknown value of U
%    at node N, which will be unknown N or N+1,
%    depending on whether there was an unknown at node 0.
%
%    Local, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Local, integer NQUAD
%    The number of quadrature points used in a subinterval.
%
%    Local, real WQUAD(NQUAD).
%    WQUAD(I) is the weight associated with the I-th point
%    of an NQUAD point Gaussian quadrature rule.
%
%    Local, real XQUAD(NQUAD,NMAX), the I-th quadrature point
%    in interval J.
%
  nquad = 2;
%
%  Given a set of N nodes (where N increases on each iteration),
%  compute the other geometric information.
%
  [ h, indx, node, nu, wquad, xquad ] = geometry ( ibc, n, nl, nmax, nquad, xn );
%
%  Assemble the linear system.
%
  [ adiag, aleft, arite, f ] = assemble ( h, n, indx, node, nu, nl, ...
    nquad, nmax, ul, ur, wquad, xn, xquad );
%
%  Print out the linear system, just once.
%
  if ( kount == 1 )
    prsys ( adiag, aleft, arite, f, nu );
  end
%
%  Solve the linear system.
%
  u = solve ( adiag, aleft, arite, f, nu );
%
%  Print out the solution.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Basic solution\n' );

  output ( u, ibc, indx, n, nu, ul, ur, xn );

  return
end
function eta = solvey ( u, h, n, nu, ul, ur, xn )

%*****************************************************************************80
%
%% SOLVEY computes error estimators for a finite element solution.
%
%  Discussion:
%
%    SOLVEY accepts information about the solution of a finite element
%    problem on a grid of nodes with coordinates XN.  It then starts
%    at node 0, and for each node, computes two "error estimators",
%    one for the left, and one for the right interval associated with the
%    node.  These estimators are found by solving a finite element problem
%    over the two intervals, using the known values of the original
%    solution as boundary data, and using a mesh that is "slightly"
%    refined over the original one.
%
%    Note that the computations at the 0-th and N-th nodes only involve
%    a single interval.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real U(NU), the finite element representation of the
%    solution of the current problem.
%
%    Input, real H(N)
%    H(I) is the length of subinterval I.  This code uses
%    equal spacing for all the subintervals.
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, real UL.
%    If IBC is 1 or 3, UL is the value that U is required
%    to have at X = XL.
%    If IBC is 2 or 4, UL is the value that U' is required
%    to have at X = XL.
%
%    Input, real UR.
%    If IBC is 2 or 3, UR is the value that U is required
%    to have at X = XR.
%    If IBC is 1 or 4, UR is the value that U' is required
%    to have at X = XR.
%
%    Input, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    Output, real ETA(N).
%    ETA(I) is the error estimate for interval I.  It is computed
%    as the sum of two quantities, one associated with the left
%    and one with the right node of the interval.
%
  nl = 2;
  ny = 2;
  nquad = 2;
  nmay = 2 * ny;
%
%  Initialize the error estimators to zero.
%
  eta(1:n) = 0.0;
%
%  Set the boundary conditions for each subproblem to be
%  known values of U at the left and right.
%
%
%  For each node, subdivide its left and right hand intervals
%  into NY subintervals.
%
%  Set up and solve the differential equation again on this
%  smaller region.
%
%  The 0-th and N-th nodes are special cases.
%
  ibcy = 3;

  for j = 0 : n

    if ( j == 0 )
      m = ny;
      jlo = j;
      jmid = j + 1;
      jhi = j + 1;
    elseif ( j == n )
      m = ny;
      jlo = j - 1;
      jmid = j;
      jhi = j;
    else
      m = 2 * ny;
      jlo = j - 1;
      jmid = j;
      jhi = j + 1;
    end
%
%  Set the location of the nodes in the subintervals.
%
    yl = xn(jlo+1);
    ym = xn(jmid+1);
    yr = xn(jhi+1);

    for i = 0 : ny
      yn(i+1) = ( ( ny - i ) * yl   ...
                + (      i ) * ym ) ...
                / ( ny     );
    end

    for i = ny+1 : m
      yn(i+1) = ( ( m - i      ) * ym   ...
                + (     i - ny ) * yr ) ...
                / ( m -     ny );
    end
%
%  Set up the geometry of the sub-problem.
%
    [ hy, indy, nodey, nuy, wquad, xquady ] = geometry ( ibcy, m, nl, ...
      nmay, nquad, yn );
%
%  Set the boundary values for the sub-problem.
%
    if ( j <= 1 )
      uly = ul;
    else
      uly = u(j-1);
    end

    if ( n - 1 <= j )
      ury = ur;
    else
      ury = u(j+1);
    end
%
%  Assemble the matrix for the sub-problem.
%
    [ adiag, aleft, arite, fy ] =  assemble ( hy, m, indy, nodey, nuy, nl, ...
      nquad, nmay, uly, ury, wquad, yn, xquady );
%
%  Solve the system.
%
    uy = solve ( adiag, aleft, arite, fy, nuy );
%
%  Compute the weighted sum of the squares of the differences
%  of the original computed slope and the refined computed slopes.
%
%  Calculation for left interval.
%
    if ( 1 <= j )

      if ( j <= 1 )
        uleft = ul;
        urite = u(1);
      elseif ( j == n )
        uleft = u(j-1);
        urite = ur;
      else
        uleft = u(j-1);
        urite = u(j);
      end

      uprime = ( urite - uleft ) / h(j);

      total = 0.0;
      for i = 1 : ny

        yl = yn(i-1+1);
        yr = yn(i+1);

        if ( i == 1 )
          vlval = uly;
          vrval = uy(i);
        elseif ( i == m )
          vlval = uy(i-1);
          vrval = ury;
        else
          vlval = uy(i-1);
          vrval = uy(i);
        end

        vprime = ( vrval - vlval ) / hy(i);

        ulval = ( real ( ny - i + 1 ) * uleft   ...
                + real (      i - 1 ) * urite ) ...
                / real ( ny         );

        urval = ( real ( ny - i ) * uleft   ...
                + real (      i ) * urite ) ...
                / real ( ny     );
%
%  Compute the integral of
%
%    p(x)*(u'(x)-v'(x))^2 + q(x)*(u(x)-v(x))^2
%
        for k = 1 : nquad

          y  =  xquady(k,i);

          uval = ( ( yl - y      ) * urval   ...
                 + (      y - yr ) * ulval ) ...
                 / ( yl     - yr );

          vval = ( ( yl - y      ) * vrval   ...
                 + (      y - yr ) * vlval ) ...
                 / ( yl     - yr );

          total = total + 0.5 * wquad(k) * hy(i) * ...
            ( pp ( y ) * ( uprime - vprime )^2 ...
            + qq ( y ) * ( uval - vval )^2 );

        end

      end

      eta(j) = eta(j) + 0.5 * sqrt ( total );

    end
%
%  Calculation for right interval.
%
    if ( j <= n - 1 )

      if ( j == 0 )
        uleft = ul;
        urite = u(j+1);
      elseif ( n - 1 <= j )
        uleft = u(j);
        urite = ur;
      else
        uleft = u(j);
        urite = u(j+1);
      end

      uprime = ( urite - uleft ) / h(j+1);

      total = 0.0;
      for i = m+1-ny : m

        yl = yn(i);
        yr = yn(i+1);

        if ( i == 1 )
          vlval = uly;
          vrval = uy(i);
        elseif ( i == m )
          vlval = uy(i-1);
          vrval = ury;
        else
          vlval = uy(i-1);
          vrval = uy(i);
        end

        vprime = ( vrval - vlval ) / hy(i);

        ulval = ( (      m - i + 1 ) * uleft   ...
                + ( ny - m + i - 1 ) * urite ) ...
                / ( ny             );

        urval = ( (      m - i ) * uleft   ...
                + ( ny - m + i ) * urite ) ...
                / ( ny         );
%
%  Compute the integral of
%
%    p(x)*(u'(x)-v'(x))^2 + q(x)*(u(x)-v(x))^2
%
        for k = 1 : nquad

          y  =  xquady(k,i);

          uval = ( ( yl - y      ) * urval   ...
                 + (      y - yr ) * ulval ) ...
                 / ( yl     - yr );

          vval = ( ( yl - y      ) * vrval   ...
                 + (      y - yr ) * vlval ) ...
                 / ( yl     - yr );
 
          total = total + 0.5 * wquad(k) * hy(i) * ...
            ( pp ( y ) * ( uprime - vprime )^2 ...
            + qq ( y ) * ( uval - vval )^2 );

        end

      end

      eta(j+1) = eta(j+1) + 0.5 * sqrt ( total );

    end

  end
%
%  Print out the error estimators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ETA\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %12f\n', eta(j) );
  end

  return
end
function [ n, xn, status ] = subdiv ( eta, kount, n, nmax, tol, xn )

%*****************************************************************************80
%
%% SUBDIV decides which intervals should be subdivided.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ETA(N).
%    ETA(I) is the error estimate for interval I.  It is computed
%    as the sum of two quantities, one associated with the left
%    and one with the right node of the interval.
%
%    Input, integer KOUNT, the number of adaptive steps that have been taken.
%
%    Input, integer N
%    The number of subintervals into which the interval
%    [XL,XR] is broken.  
%
%    Input, integer NMAX, the maximum number of unknowns that can be handled.
%
%    Input, real TOL.
%    A tolerance that is used to determine whether the estimated
%    error in an interval is so large that it should be subdivided
%    and the problem solved again.
%
%    Input, real XN(0:N).
%    XN(I) is the location of the I-th node.  XN(0) is XL,
%    and XN(N) is XR.
%
%    Output, integer N, the updated number of nodes.
%
%    Output, real XN(0:N), the updated nodes.
%
%    Output, integer STATUS, reports status of subdivision.
%    0, a new subdivision was carried out.
%    1, no more subdivisions are needed.
%    -1, no more subdivisions can be carried out.
%
%  Local Parameters:
%
%    Local, integer JADD(N).
%    JADD(I) is 1 if the error estimates show that interval I
%    should be subdivided.
%
  status = 0;
%
%  Add up the ETA's, and get their average.
%
  ave = sum ( eta(1:n) ) / n;
%
%  Look for intervals whose ETA value is relatively large,
%  and note in JADD that these intervals should be subdivided.
%
  k = 0;
  temp = max ( 1.2 * ave + 0.00001, tol^2 / n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Tolerance = %f\n', temp );
  fprintf ( 1, '\n' );

  for j = 1 : n

    if ( temp < eta(j) )
      k = k + 1;
      jadd(j) = 1;
      fprintf ( 1, 'Subdivide interval %d\n', j );
    else
      jadd(j) = 0;
    end

  end
%
%  If no subdivisions needed, we're done.
%
  if ( k <= 0 )
    fprintf ( 1, 'Success on step %d\n', kount );
    status = 1;
    return
  end
%
%  See if we're about to go over our limit.
%
  if ( nmax < n + k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The iterations did not reach their goal.\n' );
    fprintf ( 1, 'The next value of N is %d\n', n + k );
    fprintf ( 1, 'which exceeds NMAX = %d\n', nmax );
    status = -1;
    return
  end
%
%  Insert new nodes where needed.
%
  k = 0;
  xt(1) = xn(1);
  for j = 1 : n

    if ( 0 < jadd(j) )
      xt(j+k+1) = 0.5 * ( xn(j+1) + xn(j) );
      k = k + 1;
    end

    xt(j+k+1) = xn(j+1);

  end
%
%  Update the value of N, and copy the new nodes into XN.
%
  n = n + k;

  xn(1:n+1) = xt(1:n+1);

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
function value = uexact ( x )

%*****************************************************************************80
%
%% UEXACT returns the value of the exact solution at any point X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2006
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of the exact solution at X.
%

%
%  Find out which problem we're working on.
%
  problem = get_problem ( );

  if ( problem == 1 )
    value = x;
  elseif ( problem == 2 )
    value = x^2;
  elseif ( problem == 3 )
    value = sin ( pi * x / 2.0 );
  elseif ( problem == 4 )
    value = cos ( pi * x / 2.0 );
  elseif ( problem == 5 )
    beta = get_beta ( );
    value = ( x^( beta + 2.0 ) ) ...
      / ( ( beta + 2.0 ) * ( beta + 1.0 ) );
  elseif ( problem == 6 )
    alpha = get_alpha ( );
    value = atan ( ( x - 0.5 ) / alpha );
  else
    value = 0.0;
  end

  return
end
