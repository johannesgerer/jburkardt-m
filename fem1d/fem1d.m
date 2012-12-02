function fem1d ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEM1D.
%
%  Discussion:
%
%    FEM1D solves a one dimensional ODE using the finite element method.
%
%    The differential equation has the form:
%
%      -d/dx ( p(x) du/dx ) + q(x) * u = f(x)
%
%    The finite-element method uses piecewise linear basis functions.
%
%    Here U is an unknown scalar function of X defined on the
%    interval [XL,XR], and P, Q and F are given functions of X.
%
%    The values of U or U' at XL and XR are also specified.
%
%    The interval [XL,XR] is "meshed" with NSUB+1 points,
%
%    XN(0) = XL, XN(1)=XL+H, XN(2)=XL+2*H, ..., XN(NSUB)=XR.
%
%    This creates NSUB subintervals, with interval number 1
%    having endpoints XN(0) and XN(1), and so on up to interval
%    NSUB, which has endpoints XN(NSUB-1) and XN(NSUB).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2008
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
%    real F(NU).
%    ASSEMBLE stores into F the right hand side of the linear
%    equations.
%    SOLVE replaces those values of F by the solution of the
%    linear equations.
%
%    real H(N), the length of the subintervals.  
%
%    integer IBC. declares what the boundary conditions are.
%    1, at the left endpoint, U has the value UL,
%       at the right endpoint, U' has the value UR.
%    2, at the left endpoint, U' has the value UL,
%       at the right endpoint, U has the value UR.
%    3, at the left endpoint, U has the value UL,
%       and at the right endpoint, U has the value UR.
%    4, at the left endpoint, U' has the value UL,
%       at the right endpoint U' has the value UR.
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
%    integer NL, the number of basis functions used in a single
%    subinterval.  (NL-1) is the degree of the polynomials
%    used.  For this code, NL is fixed at 2, meaning that
%    piecewise linear functions are used as the basis.
%
%    integer NODE(NL,N).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
%
%    integer NSUB, the number of subintervals into which the interval
%    [XL,XR] is broken.
%
%    integer NU, the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
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
%    real XL, the left endpoint of the interval over which the
%    differential equation is being solved.
%
%    real XN(1:N+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    real XQUAD(N)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
%
%    real XR, the right endpoint of the interval over which the
%    differential equation is being solved.
%
  n = 100;
  nl = 2;

  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the two-point boundary value problem:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    -d/dx (p(x) du/dx) + q(x)*u  =  f(x)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  on an interval [xl,xr], with the values of\n' );
  fprintf ( 1, '  u or u'' specified at xl and xr.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The interval is broken into %d subintervals.\n', n );
  fprintf ( 1, '  The number of basis functions per element is %d\n', nl );
%
%  Initialize variables that define the problem.
%
  [ ibc, nquad, ul, ur, xl, xr ] = init ( );
%
%  Compute the quantities that describe the geometry of the problem.
%
  [ h, indx, node, nu, xn, xquad ] = geometry ( ibc, nl, n, xl, xr );
%
%  Assemble the matrix.
%
  [ adiag, aleft, arite, f ] = assemble ( h, indx, nl, node, ...
    nu, nquad, n, ul, ur, xn, xquad );
%
%  Print out the linear system.
%
  system_print ( adiag, aleft, arite, f, nu );
%
%  Solve the linear system.
%
  u = solve ( adiag, aleft, arite, f, nu );
%
%  Print the current solution.
%
  output ( u, ibc, indx, n, nu, ul, ur, xn );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ adiag, aleft, arite, f ] = assemble ( h, indx, nl, ...
  node, nu, nquad, n, ul, ur, xn, xquad )

%*****************************************************************************80
%
%% ASSEMBLE assembles the matrix and right hand side of the linear system.
%
%  Discussion:
%
%    Note that a 1 point quadrature rule, which is sometimes used to
%    assemble the matrix and right hand side, is just barely accurate
%    enough for simple problems.  If you want better results, you
%    should use a quadrature rule that is more accurate.
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
%    Input, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be N-1,
%    N, or N+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Input, integer NQUAD, the number of quadrature points in a subinterval.
%    This code uses NQUAD = 1.
%
%    Input, integer N, the number of subintervals into which the interval
%    [XL,XR] is broken.
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
%    Input, real XN(1:N+1), the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Input, real XQUAD(N), the location of the single quadrature point
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
%    Output, real F(NU), the right hand side of the linear
%    equations.
%
  f(1:nu) = 0.0;
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
%  For basis function IL...
%
      for il = 1 : nl

        ig = node(il,ie);
        iu = indx(ig+1);

        if ( 0 < iu )

          [ phii, phiix ] = phi ( il, xqe, xleft, xrite );

          f(iu) = f(iu) + he * ff ( xqe ) * phii;
%
%  Handle boundary conditions.
%
          if ( ig == 0 )

            x = xn(1);
            f(iu) = f(iu) - pp ( x ) * ul;

          elseif ( ig == n )

            x = xn(n+1);
            f(iu) = f(iu) + pp ( x ) * ur;

          end
%
%  For basis function JL...
%
          for jl = 1 : nl

            jg = node(jl,ie);
            ju = indx(jg+1);

            [ phij, phijx ] = phi ( jl, xqe, xleft, xrite );

            aij = he * ( pp ( xqe ) * phiix * phijx ...
                  + qq ( xqe ) * phii * phij );

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
%% FF returns the right hand side of the differential equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
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
  value = 0.0;

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
%    09 November 2006
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
%    Output, real H(NSUB), the length of the subintervals.  
%
%    Output, integer INDX(1:NSUB+1).
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
%    Output, integer NODE(NL,NSUB).
%    For each subinterval I:
%    NODE(1,I) is the number of the left node, and
%    NODE(2,I) is the number of the right node.
%
%    Output, integer NU.
%    NU is the number of unknowns in the linear system.
%    Depending on the value of IBC, there will be NSUB-1,
%    NSUB, or NSUB+1 unknown values, which are the coefficients
%    of basis functions.
%
%    Output, real XN(1:NSUB+1).
%    XN(I) is the location of the I-th node.  XN(1) is XL,
%    and XN(N+1) is XR.
%
%    Output, real XQUAD(NSUB)
%    XQUAD(I) is the location of the single quadrature point
%    in interval I.
%

%
%  Set the value of XN, the locations of the nodes.
%
  xn = zeros ( nsub + 1, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node      Location\n' );
  fprintf ( 1, '\n' );
  for i = 0 : nsub
    xn(i+1) =  ( ( nsub - i ) * xl   ...
               + (        i ) * xr ) ...
               / ( nsub     );
  end
  r8vec_print_some ( nsub + 1, xn, 1, 10, '  First 10 nodes:' );
%
%  Set the lengths of each subinterval.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Subint    Length\n' );
  fprintf ( 1, '\n' );
  h = zeros ( nsub, 1 );
  for i = 1 : nsub
    h(i) = xn(i+1) - xn(i);
  end
  r8vec_print_some ( nsub, h, 1, 10, '  First 10 interval widths:' );
%
%  Set the quadrature points, each of which is the midpoint of its subinterval.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Subint    Quadrature point\n' );
  fprintf ( 1, '\n' );
  xquad = zeros ( nsub );
  for i = 1 : nsub
    xquad(i) = 0.5 * ( xn(i) + xn(i+1) );
  end
  r8vec_print_some ( nsub, xquad, 1, 10, '  First 10 quadrature points:' );
%
%  Set the value of NODE, which records, for each interval,
%  the node numbers at the left and right.
%
  node = zeros ( 2, nsub );
  for i = 1 : nsub
    node(1,i) = i - 1;
    node(2,i) = i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 10 pairs of nodes defining intervals:\n' );
  fprintf ( 1, 'Subint  Left Node  Right Node\n' );
  fprintf ( 1, '\n' );
  for i = 1 : min ( nsub, 10 )
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
  if ( ibc == 1 || ibc == 3 )
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
  if ( ibc == 2 || ibc == 3 )
    indx(i+1) = -1;
  else
    nu = nu + 1;
    indx(i+1) = nu;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 10 unknown indices\n' );
  fprintf ( 1, '    Node  Unknown\n' );
  fprintf ( 1, '\n' );
  for i = 0 : min ( nsub, 9 )
    fprintf ( 1, '  %6d  %6d\n', i, indx(i+1) );
  end

  return
end
function [ ibc, nquad, ul, ur, xl, xr ] = init  ( )

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
%    09 November 2006
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
%    Output, integer NQUAD.
%    The number of quadrature points used in a subinterval.
%    This code uses NQUAD = 1.
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
  nquad = 1;
  ul = 0.0;
  ur = 1.0;
  xl = 0.0;
  xr = 1.0;
%
%  Print out the values that have been set.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'The equation is to be solved for\n' );
  fprintf ( 1, 'X greater than XL = %f\n', xl );
  fprintf ( 1, ' and less than XR = %f\n', xr );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'The boundary conditions are:\n' );
  fprintf ( 1, '\n' );

  if ( ibc == 1 || ibc == 3 )
    fprintf ( 1, '  At X = XL, U = %f\n', ul );
  else
    fprintf ( 1, '  At X = XL, U'' = %f\n', ul );
  end

  if ( ibc == 2 || ibc == 3 )
    fprintf ( 1, '  At X = XR, U = %f\n', ur );
  else
    fprintf ( 1, '  At X = XR, U'' = %f\n', ur );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Number of quadrature points per element is %d\n', nquad );
 
  return
end
function output ( f, ibc, indx, nsub, nu, ul, ur, xn )

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
%    09 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, real F(NU), the solution of the linear equations.
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
  fprintf ( 1, 'First 10 entries of computed solution:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Node        X(I)          U(I)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : min ( nsub, 9 )

    if ( i == 0 )
      if ( ibc == 1 || ibc == 3 )
        u = ul;
      else
        u = f(indx(i+1));
      end
    elseif ( i == nsub )
      if ( ibc == 2 || ibc == 3 )
        u = ur;
      else
        u = f(indx(i+1));
      end
    else
      u = f(indx(i+1));
    end

    fprintf ( 1, '  %6d  %12f  %12f\n', i, xn(i+1), u );

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
%    09 November 2006
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
  if ( xleft <= x && x <= xrite )

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
%% PP returns the value of the coefficient function P(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
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
  value = 1.0;

  return
end
function value = qq ( x )

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
%    09 November 2006
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
  value = 0.0;

  return
end
function r8vec_print_some ( n, a, i_lo, i_hi, title )

%*****************************************************************************80
%
%% R8VEC_PRINT_SOME prints "some" of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
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
%    Input, integer MAX_PRINT, the maximum number of lines to print.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = max ( 1, i_lo ) : min ( n, i_hi )
    fprintf ( 1, '  %8d: %12f\n', i, a(i) );
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
%    09 November 2006
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

  u = zeros ( nu, 1 );
  
  u(1) = f(1) / adiag(1);
  for i = 2 : nu
    u(i) = ( f(i) - aleft(i) * u(i-1) ) / adiag(i);
  end

  for i = nu-1 : -1 : 1
    u(i) = u(i) - arite(i) * u(i+1);
  end

  return
end
function system_print ( adiag, aleft, arite, f, nu )

%*****************************************************************************80
%
%% SYSTEM_PRINT prints out the tridiagonal linear system to be solved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ADIAG(NU), ALEFT(NU), ARITE(NU),
%    the diagonal, left and right entries of the equations.
%
%    Input, real F(NU), the right hand side of the linear system.
%
%    Input, integer NU, the number of equations to be solved.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'First 10 rows of tridiagonal linear system:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Equation   ALEFT         ADIAG         ARITE         RHS\n' );
  fprintf ( 1, '\n' );

  for i = 1 : min ( nu, 10 )

    fprintf ( 1, '%3d', i );

    if ( i == 1 )
      fprintf ( 1, '              ' );
    else
      fprintf ( 1, '  %12f', aleft(i) );
    end

    fprintf ( 1, '  %12f', adiag(i) );

    if ( i < nu )
      fprintf ( 1, '  %12f', arite(i) );
    else
      fprintf ( 1, '              ' );
    end

    fprintf ( 1, '  %12f\n', f(i) );

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
