function fem1d_nonlinear ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEM1D_NONLINEAR.
%
%  Discussion:
%
%    FEM1D_NONLINLEAR solves a nonlinear one dimensional boundary value problem.
%
%    The differential equation has the form:
%
%      -d/dx ( p(x) du/dx ) + q(x) * u + u * u' = f(x)
%
%    The finite-element method uses piecewise linear basis functions.
%
%    Here U is an unknown scalar function of X defined on the
%    interval [XL,XR], and P, Q and F are given functions of X.
%
%    The values of U or U' at XL and XR are also specified.
%
%    Sample problem #1:
%
%    u(x) = x, 
%    p(x) = 1, 
%    q(x) = 0, 
%    f(x) = x, 
%    u(0) = 0, 
%    u'(1) = 1.
%
%    The code should solve this problem exactly.
%
%    Sample problem #2:
%
%    u(x)  = 2*(1-cos(0.5*pi*x))/pi, 
%    p(x)  = 1, 
%    q(x)  = 0,
%    f(x)  = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0)  = 0, 
%    u'(1) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2006
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
%    real H(N), the length of the subintervals.  
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
%    integer IMAX.
%    The number of Newton iterations to carry out.
%
%    integer INDX(1:N+1).
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
%    integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out when compared to the exact solution.
%
%    integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
%
%    integer N.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
%
%    real RHS(NU), the right hand side of the linear equations
%    for the Picard or Newton iterations.
%
%    real U(NU).
%    U contains the value of the solution from the previous iteration,
%    and is used in ASSEMBLE to add correction terms to the
%    matrix and right hand side.
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
%    real XL.
%    XL is the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    real XNEWT.
%    A factor which is 0 for the first three iterations, and
%    1 thereafter.  It multiplies some terms in ASSEMBLE,
%    and thus is used to "weaken" the nonlinearity for
%    the first few steps.
%
%    real XQUAD(N)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
%
%    real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
  n = 10;
  nl = 2;

  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_NONLINEAR\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve a nonlinear boundary value problem:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    -d/dx (p(x) du/dx) + q(x)*u  + u*u'' =  f(x)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  on an interval [xl,xr], with the values of\n' );
  fprintf ( 1, '  u or u'' specified at xl and xr.\n' );
%
%  Initialize variables that define the problem.
%
  [ ibc, imax, nprint, nquad, problem, ul, ur, xl, xr ] = init ( );
%
%  Compute the quantities that describe the geometry of the problem.
%
  [ h, indx, node, nu, xn, xquad ] = geometry ( ibc, nl, n, xl, xr );
%
%  The initial solution estimate is 0.
%
  u(1:nu) = 0.0;
%
%  Begin the Newton iteration.
%
  for i = 1 : imax
%
%  Is it time for full nonlinear Newton iteration?
%  For the first 3 steps, we use a weaker iteration that is less
%  likely to diverge.
%
    if ( i <= 5 )
      [ adiag, aleft, arite, rhs ] = assemble_picard ( u, h, indx, n, nl, node, ...
        nquad, nu, problem, ul, ur, xn, xquad );
    else
      [ adiag, aleft, arite, rhs ] = assemble_newton ( u, h, indx, n, nl, node, ...
        nquad, nu, problem, ul, ur, xn, xquad );
    end
%
%  Print out the linear system, just once.
%
    if ( i == 1 || i == 6 )
      prsys ( adiag, aleft, arite, rhs, nu );
    end
%
%  Solve the linear system A * Unew = RHS.
%
    u = solve ( adiag, aleft, arite, rhs, nu );
%
%  Print the current solution.
%
    output ( u, ibc, indx, n, nu, ul, ur, xn );

  end
%
%  Compare the solution to the exact solution.
%
  compare ( u, indx, n, nl, node, nprint, nu, problem, ul, ur, xl, xn, xr );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_NONLINEAR:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ adiag, aleft, arite, rhs ] = assemble_newton ( u, h, indx, n, nl, ...
  node, nquad, nu, problem, ul, ur, xn, xquad )

%*****************************************************************************80
%
%% ASSEMBLE_NEWTON assembles the Newton linear system.
%
%  Discussion:
%
%    The linear system being solved here is for the Newton correction
%    to an approximate solution of a nonlinear system.
%
%    Thus, we suppose that we have a nonlinear function F(X),
%    and an approximate solution X0.  If we can suppose there is an
%    exact solution X* that is "nearby", and in fact close enough
%    that Taylor's theorem gives us a useful estimate, then we
%    may write:
%
%      F(X*) = F(X0) + F'(X0) * ( X* - X0 ) + Order ( X* - X0 )^2 
%
%    and by rearranging, we get the Newton system (which is only
%    approximately correct):
%
%      F'(X0) * ( X* - X0 ) = - F(X0)
%
%    We solve this system and add the solution to X0 to get a
%    new approximate solution that, we hope, is much improved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real U(NU), the approximate solution from the previous 
%    iteration.
%
%    Input, real H(N), the length of the subintervals.  
%
%    Input, integer INDX(1:N+1).
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
%    Input, integer N.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Input, integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
%    Input, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Input, real XQUAD(N)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
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
%    Output, real RHS(NU), the right hand side of the linear
%    equations.
%
  rhs(1:nu) = 0.0;
  adiag(1:nu) = 0.0;
  aleft(1:nu) = 0.0;
  arite(1:nu) = 0.0;
%
%  For element IE...
%
  for ie = 1 : n

    he = h(ie);
    xleft = xn(node(1,ie)+1);
    xrite = xn(node(2,ie)+1);
%
%  For quadrature point IQ...
%
    for iq = 1 : nquad

      xqe = xquad(ie);
%
%  Compute value of U for previous solution.
%
      total = 0.0;

      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( iu <= 0 )

          if ( il == 1 )
            total = total + ul;
          else
            total = total + ur;
          end

        else
          total = total + u(iu);
        end

      end

      uold = total / nl;
%
%  Compute value of U' for previous solution.
%
      jl = node(1,ie);
      jr = node(2,ie);
      iul = indx(jl+1);
      iur = indx(jr+1);

      if ( iul <= 0 )
        uoldx = ( u(iur) - ul ) / he;
      elseif ( iur <= 0 )
        uoldx = ( ur - u(iul) ) / he;
      else
        uoldx = ( u(iur) - u(iul) ) / he;
      end
%
%  For basis function IL...
%
      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( 0 < iu )

          [ phii, phiix ] = phi ( il, xqe, xleft, xrite );

          rhs(iu) = rhs(iu) + he * phii * ( ff ( xqe, problem ) + uold * uoldx );
%
%  Handle boundary conditions that prescribe the value of U'.
%
          if ( ig == 0 )

            x = 0.0;
            rhs(iu) = rhs(iu) - pp ( x, problem ) * ul;

          elseif ( ig == n )

            x = 1.0;
            rhs(iu) = rhs(iu) + pp ( x, problem ) * ur;

          end
%
%  For basis function JL...
%
          for jl = 1 : nl

            jg = node(jl,ie);
            ju = indx(jg+1);

            [ phij, phijx ] = phi ( jl, xqe, xleft, xrite );

            aij = he * ( pp ( xqe, problem ) * phiix * phijx ...
                  + qq ( xqe, problem ) * phii * phij ...
                  + uold * phii * phijx ...
                  + uoldx * phij * phii );

            if ( ju <= 0 )

              if ( jg == 0 )
                rhs(iu) = rhs(iu) - aij * ul;
              elseif ( jg == n )
                rhs(iu) = rhs(iu) - aij * ur;
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
function [ adiag, aleft, arite, rhs ] = assemble_picard ( u, h, indx, n, nl, ...
  node, nquad, nu, problem, ul, ur, xn, xquad )

%*****************************************************************************80
%
%% ASSEMBLE_PICARD assembles the Picard lienar system.
%
%  Discussion:
%
%    The equation we are trying to solve has the form:
%
%      -d/dx ( p(x) du/dx ) + q(x) * u + u * u' = f(x)
%
%    For the Picard iteration, we need to modify the nonlinear term u * u'
%    so that it is linear in the unknown u, and any other factors of u are
%    lagged.  One way to do this gives us the following equation:
%
%      -d/dx ( p(x) du/dx ) + q(x) * u + u * uold' = f(x)
%
%    where uold is the previous iterate.
%
%    Now we can formulate this system as a (linear) finite element problem
%
%      A * u = rhs
%
%    to be solved for the new approximate solution u.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real U(NU), the approximate solution from the previous 
%    iteration.
%
%    Input, real H(N), the length of the subintervals.  
%
%    Input, integer INDX(1:N+1).
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
%    Input, integer N.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Input, integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
%    Input, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Input, real XQUAD(N)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
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
%    Output, real RHS(NU), the right hand side of the linear
%    equations.
%
  rhs(1:nu) = 0.0;
  adiag(1:nu) = 0.0;
  aleft(1:nu) = 0.0;
  arite(1:nu) = 0.0;
%
%  For element IE...
%
  for ie = 1 : n

    he = h(ie);
    xleft = xn(node(1,ie)+1);
    xrite = xn(node(2,ie)+1);
%
%  For quadrature point IQ...
%
    for iq = 1 : nquad

      xqe = xquad(ie);
%
%  Compute value of U for previous solution.
%
      total = 0.0;

      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( iu <= 0 )

          if ( il == 1 )
            total = total + ul;
          else
            total = total + ur;
          end

        else
          total = total + u(iu);
        end

      end

      uold = total / nl;
%
%  Compute value of U' for previous solution.
%
      jl = node(1,ie);
      jr = node(2,ie);
      iul = indx(jl+1);
      iur = indx(jr+1);

      if ( iul <= 0 )
        uoldx = ( u(iur) - ul ) / he;
      elseif ( iur <= 0 )
        uoldx = ( ur - u(iul) ) / he;
      else
        uoldx = ( u(iur) - u(iul) ) / he;
      end
%
%  For basis function IL...
%
      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( 0 < iu )

          [ phii, phiix ] = phi ( il, xqe, xleft, xrite );

          rhs(iu) = rhs(iu) + he * phii * ff ( xqe, problem );
%
%  Handle boundary conditions that prescribe the value of U'.
%
          if ( ig == 0 )

            x = 0.0;
            rhs(iu) = rhs(iu) - pp ( x, problem ) * ul;

          elseif ( ig == n )

            x = 1.0;
            rhs(iu) = rhs(iu) + pp ( x, problem ) * ur;

          end
%
%  For basis function JL...
%
          for jl = 1 : nl

            jg = node(jl,ie);
            ju = indx(jg+1);

            [ phij, phijx ] = phi ( jl, xqe, xleft, xrite );

            aij = he * ( pp ( xqe, problem ) * phiix * phijx ...
                  + qq ( xqe, problem ) * phii * phij ...
                  + uold * phii * phijx );

            if ( ju <= 0 )

              if ( jg == 0 )
                rhs(iu) = rhs(iu) - aij * ul;
              elseif ( jg == n )
                rhs(iu) = rhs(iu) - aij * ur;
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
function output2 ( f, indx, n, nl, node, nprint, nu, problem, ul, ur, xl, xn, ...
  xr )

%*****************************************************************************80
%
%% OUTPUT2 compares the computed and exact solutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real F(NU), the solution of the linear equations.
%
%    Input, integer INDX(1:N+1).
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
%    Input, integer N.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Input, integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out when compared to the exact solution.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
%    Input, real XL.
%    XL is the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    Input, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Input, real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Compare computed and exact solutions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                X             U(X)          U(exact)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nprint

    x = ( ( nprint - i     ) * xl   ...
        + (          i - 1 ) * xr ) ...
        / ( nprint     - 1 );

    ux = u_exact ( x, problem );

    for j = 1 : n

      xleft = xn(j);
      xrite = xn(j+1);
%
%  Search for the interval that X lies in.
%
      if ( xleft <= x & x <= xrite )

        u = 0.0;

        for k = 1 : nl

          ig = node(k,j);
          iu = indx(ig+1);
          [ phii, phiix ] = phi ( k, x, xleft, xrite );

          if ( iu <= 0 )
            if ( j == 1 & k == 1 )
              u = u + ul * phii;
            elseif ( j == n & k == nl )
              u = u + ur * phii;
            end
          else
            u = u + f(iu) * phii;
          end

        end

        break;

      end

    end

    fprintf ( 1, '          %12f  %12f  %12f\n', x, u, ux );

  end

  return
end
function value = ff ( x, problem )

%*****************************************************************************80
%
%% FF returns the right hand side of the differential equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
%
%    Output, real VALUE, the value of F(X).
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = x;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = - 0.5 * pi * cos ( 0.5 * pi * x ) ...
      + 2.0 * sin ( 0.5 * pi * x ) ...
      * ( 1.0 - cos ( 0.5 * pi * x ) ) / pi;

  end

  return
end
function [ h, indx, node, nu, xn, xquad ] = geometry ( ibc, nl, nsub, ...
  xl, xr )

%*****************************************************************************80
%
%% GEOMETRY sets up the geometry for the interval [XL,XR].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2006
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
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NSUB.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, real XL.
%    XL is the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    Input, real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
%    Output, real H(N), the length of the subintervals.  
%
%    Output, integer INDX(1:N+1).
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
%    Output, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Output, real XQUAD(N)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
%

%
%  Set the value of XN, the locations of the nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node      Location\n' );
  fprintf ( 1, '\n' );
  for i = 0 : nsub
    xn(i+1) =  ( ( nsub - i ) * xl   ...
               + (        i ) * xr ) ...
               / ( nsub     );
    fprintf ( 1, '  %6d  %12f\n', i, xn(i+1) );
  end
%
%  Set the lengths of each subinterval.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Subint    Length\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nsub
    h(i) = xn(i+1) - xn(i);
    fprintf ( 1, '  %6d  %12f\n', i, h(i) );
  end
%
%  Set the quadrature points, each of which is the midpoint of its subinterval.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Subint    Quadrature point\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nsub
    xquad(i) = 0.5 * ( xn(i) + xn(i+1) );
    fprintf ( 1, '  %6d  %12f\n', i, xquad(i) );
  end
%
%  Set the value of NODE, which records, for each interval,
%  the node numbers at the left and right.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Subint  Left Node  Right Node\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nsub
    node(1,i) = i - 1;
    node(2,i) = i;
    fprintf ( 1, '  %6d  %6d  %6d\n', i, node(1,i), node(2,i) );
  end
%
%  Starting with node 0, see if an unknown is associated with
%  the node.  If so, give it an index.
%
  nu = 0;
%
%  Handle first node.
%
  i = 0;
  if ( ibc == 1 | ibc == 3 )
    indx(i+1) = -1;
  else
    nu = nu + 1;
    indx(i+1) = nu;
  end
%
%  Handle nodes 1 through nsub-1
%
  for i = 1 : nsub-1
    nu = nu + 1;
    indx(i+1) = nu;
  end
%
%  Handle the last node.
%
  i = nsub;
  if ( ibc == 2 | ibc == 3 )
    indx(i+1) = -1;
  else
    nu = nu + 1;
    indx(i+1) = nu;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node  Unknown\n' );
  fprintf ( 1, '\n' );
  for i = 0 : nsub
    fprintf ( 1, '  %6d  %6d\n', i, indx(i+1) );
  end

  return
end
function [ ibc, imax, nprint, nquad, problem, ul, ur, xl, xr ] = init  ( )

%*****************************************************************************80
%
%% INIT initializes variables that define the problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
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
%    Output, integer IMAX.
%    The number of Newton iterations to carry out.
%
%    Output, integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out when compared to the exact solution.
%
%    Output, integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
%
%    Output, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
%    Output, real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
  ibc = 1;
  imax = 20;
  nprint = 9;
  nquad = 1;
  problem = 1;
  ul = 0.0;
  ur = 1.0;
  xl = 0.0;
  xr = 1.0;
%
%  Print out the values that have been set.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'The equation is to be solved for\n' );
  fprintf ( 1, 'X greater than XL  =  ', xl );
  fprintf ( 1, ' and less than XR = ', xr );
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
    fprintf ( 1, '  At X = XR, U'' = %f\n', ur );
  end

  if ( problem == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is test problem #1:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  P(X) = 1, Q(X) = 0, F(X) = X.\n' );
    fprintf ( 1, '  Boundary conditions: U(0) = 0, U''(1) = 1.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The exact solution is U(X) = X\n' );
  elseif ( problem == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is test problem #2:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  P(X) = 1, Q(X) = 0, \n' );
    fprintf ( 1, '  F(X) = -0.5*pi*cos(0.5*pi*X)\n' );
    fprintf ( 1, '        + 2*sin(0.5*pi*X)*(1-cos(0.5*pi*X)/pi.\n' );
    fprintf ( 1, '  Boundary conditions: U(0) = 0, U''(1) = 1.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The exact solution is U(X) = 2*(1-cos(pi*x/2))/pi\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Number of quadrature points per element is %d\n', nquad );
  fprintf ( 1, 'Number of iterations is %d\n', imax );
 
  return
end
function output ( u, ibc, indx, nsub, nu, ul, ur, xn )

%*****************************************************************************80
%
%% OUTPUT prints out the computed solution at the nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real U(NU), the solution of the linear equations.
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
%    Input, integer INDX(1:N+1).
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
%    integer NSUB.
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
%    Input, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Computed solution:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Node        X(I)          U(X(I))\n' );
  fprintf ( 1, '\n' );

  for i = 0 : nsub

    if ( i == 0 )
      if ( ibc == 1 | ibc == 3 )
        value = ul;
      else
        value = u(indx(i+1));
      end
    elseif ( i == nsub )
      if ( ibc == 2 | ibc == 3 )
        value = ur;
      else
        value = u(indx(i+1));
      end
    else
      value = u(indx(i+1));
    end

    fprintf ( 1, '  %6d  %12f  %12f\n', i, xn(i+1), value );

  end

  return
end
function output2 ( f, indx, n, nl, node, nprint, nu, problem, ul, ur, xl, xn, ...
  xr )

%*****************************************************************************80
%
%% OUTPUT2 compares the computed and exact solutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real F(NU), the solution of the linear equations.
%
%    Input, integer INDX(1:N+1).
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
%    Input, integer N.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Input, integer NPRINT.
%    The number of points at which the computed solution
%    should be printed out when compared to the exact solution.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
%    Input, real XL.
%    XL is the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    Input, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Input, real XR.
%    XR is the right endpoint of the interval over which the
%    differential equation is being solved.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Compare computed and exact solutions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                X             U(X)          U(exact)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nprint

    x = ( ( nprint - i     ) * xl   ...
        + (          i - 1 ) * xr ) ...
        / ( nprint     - 1 );

    ux = u_exact ( x, problem );

    for j = 1 : n

      xleft = xn(j);
      xrite = xn(j+1);
%
%  Search for the interval that X lies in.
%
      if ( xleft <= x & x <= xrite )

        u = 0.0;

        for k = 1 : nl

          ig = node(k,j);
          iu = indx(ig+1);
          [ phii, phiix ] = phi ( k, x, xleft, xrite );

          if ( iu <= 0 )
            if ( j == 1 & k == 1 )
              u = u + ul * phii;
            elseif ( j == n & k == nl )
              u = u + ur * phii;
            end
          else
            u = u + f(iu) * phii;
          end

        end

        break;

      end

    end

    fprintf ( 1, '          %12f  %12f  %12f\n', x, u, ux );

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
%    In any interval, there are just two basis functions.  The first
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
%    02 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer IL, the index of the basis function.
%    1, the function which is 1 at XLEFT and 0 at XRITE.
%    2, the function which is 0 at XLEFT and 1 at XRITE.
%
%    Input, real X, the evaluation point.
%
%    Input, real XLEFT, XRITE, the left and right
%    endpoints of the interval.
%
%    Output, real PHII, PHIIX, the value of the
%    basis function and its derivative at X.
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
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
function prsys ( adiag, aleft, arite, f, nu )

%*****************************************************************************80
%
%% PRSYS prints out the tridiagonal linear system to be solved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ADIAG(NU), ALEFT(NU), ARITE(NU),
%    the diagonal, left and right entries of the equations.
%
%    Input, real F(NU), the right hand side of the linear
%    system to be solved.
%
%    Input, integer NU.
%    NU is the number of equations to be solved.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Printout of tridiagonal linear system:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Equation  ALEFT  ADIAG  ARITE  RHS\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nu
    if ( i == 1 )
      fprintf ( 1, '%3d                %12f  %12f  %12f\n', ...
        i, adiag(i), arite(i), f(i) )
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
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
%
%    Output, real VALUE, the value of Q(X).
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = 0.0;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = 0.0;

  end

  return
end
function r = residual ( u, h, indx, n, nl, node, nquad, nu, problem, ul, ...
  ur, xn, xquad )

%*****************************************************************************80
%
%% RESIDUAL assembles the residual vector.
%
%  Discussion:
%
%    The equation we want to solve is
%
%      F(X) = -d/dx (p(x) du/dx) + q(x) * u + u * du/dx - f(x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real U(NU), an approximate solution to the problem.
%
%    Input, real H(N), the length of the subintervals.  
%
%    Input, integer INDX(1:N+1).
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
%    Input, integer N.
%    The number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    Input, integer NL.
%    The number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    Input, integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Input, integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
%
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
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
%    Input, real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Input, real XQUAD(N)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
%
%    Output, real F(NU), the residual vector.
%
  f(1:nu) = 0.0;
%
%  For element IE...
%
  for ie = 1 : n

    he = h(ie);
    xleft = xn(node(1,ie)+1);
    xrite = xn(node(2,ie)+1);
%
%  For quadrature point IQ...
%
    for iq = 1 : nquad

      xqe = xquad(ie);
%
%  Compute value of U.
%
      total = 0.0;

      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( iu <= 0 )

          if ( il == 1 )
            total = total + ul;
          else
            total = total + ur;
          end

        else
          total = total + u(iu);
        end

      end

      uold = total / nl;
%
%  Compute value of U'.
%
      jl = node(1,ie);
      jr = node(2,ie);
      iul = indx(jl+1);
      iur = indx(jr+1);

      if ( iul <= 0 )
        uoldx = ( u(iur) - ul ) / he;
      elseif ( iur <= 0 )
        uoldx = ( ur - u(iul) ) / he;
      else
        uoldx = ( u(iur) - u(iul) ) / he;
      end
%
%  For basis function IL...
%
      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( 0 < iu )

          [ phii, phiix ] = phi ( il, xqe, xleft, xrite );

          f(iu) = f(iu) + he * phii * ( ff ( xqe, problem ) ...
                - uold * uoldx * xnewt );
%
%  Handle boundary conditions that prescribe the value of U'.
%
          if ( ig == 0 )

            xqe = 0.0;
            f(iu) = f(iu) - pp ( xqe, problem ) * ul;

          elseif ( ig == n )

            xqe = 1.0;
            f(iu) = f(iu) + pp ( xqe, problem ) * ur;

          end
%
%  For basis function JL...
%
          for jl = 1 : nl

            jg = node(jl,ie);
            ju = indx(jg+1);

            [ phij, phijx ] = phi ( jl, xqe, xleft, xrite );

            aij = he * ( pp ( xqe, problem ) * phiix * phijx ...
                  + qq ( xqe, problem ) * phii * phij ...
                  + uold * phii * phijx ...
                  + xnewt * uoldx * phij * phii );

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
%    02 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real ADIAG(NU), ALEFT(NU), ARITE(NU).
%    the diagonal, left and right entries of the equations.
%    Note that for the first equation, there is no ALEFT
%    coefficient, and for the last, there is no ARITE.
%    So there is no need to store a value in ALEFT(1), nor
%    in ARITE(NU).
%
%    Input, real F(NU),  the right hand side of the linear
%    system to be solved.
%
%    Input, integer NU.
%    NU is the number of equations to be solved.
%
%    Output, real U(NU), the solution of the linear system.
%
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
function value = u_exact ( x, problem )

%*****************************************************************************80
%
%% U_EXACT returns the value of the exact solution at a point X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer PROBLEM, indicates which problem to be solved.
%    * 1, u = x, p=1, q=0, f=x, u(0)=0, u'(1)=1.
%    * 2, u = 2*(1-cos(0.5*pi*x))/pi, p=1, q=0,
%    f = -0.5*pi*cos(0.5*pi*x) + 2*sin(0.5*pi*x)*(1-cos(0.5*pi*x)/pi
%    u(0) = 0, u'(1)=1.
%
%    Output, real VALUE, the value of the exact solution at X.
%

%
%  Test problem 1
%
  if ( problem == 1 )

    value = x;
%
%  Test problem 2
%
  elseif ( problem == 2 )

    value = 2.0 * ( 1.0 - cos ( 0.5 * pi * x ) ) / pi;

  end

  return
end
