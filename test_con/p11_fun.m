function fx = p11_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P11_FUN evaluates the function for problem 11.
%
%  Title:
%
%    Torsion of a square rod, finite element solution.
%
%  Description:
%
%    The problem is a boundary value problem on (0,1) x (0,1)
%    of the form:
%
%      - d/dx ( PHI ( dU/dx, dU/dy ) * dU/dx )
%      - d/dy ( PHI ( dU/dx, dU/dy ) * dU/dy ) = G ( U, LAMBDA )
%
%    On the 2-dimensional region [0,1] x [0,1], a regular square grid
%    is used.  If there are NSIDE nodes on a side, then the spacing
%    is H=1/(NSIDE-1).  The nodes are ordered from left to right, and
%    from bottom to top, as are the resulting square elements:
%
%      21---22---23---24---25
%       %    %    %    %    %
%       % 13 % 14 % 15 % 16 %
%       %    %    %    %    %
%      16---17---18---19---20
%       %    %    %    %    %
%       % 09 % 10 % 11 % 12 %
%       %    %    %    %    %
%      11---12---13---14---15
%       %    %    %    %    %
%       % 05 % 06 % 07 % 08 %
%       %    %    %    %    %
%      06---07---08---09---10
%       %    %    %    %    %
%       % 01 % 02 % 03 % 04 %
%       %    %    %    %    %
%      01---02---03---04---05
%
%    On a single element, the local ordering of nodes and shape
%    functions is
%
%      3----4
%      %    %
%      %    %
%      %    %
%      1----2
%
%    Linear elements are used.  If H is the length of a side, the shape
%    function in a particular element associated with node 1 is:
%
%      PSI(X,Y) = ( X - XRIGHT ) * ( Y - YTOP ) / H**2
%
%    where
%
%      XRIGHT is the X coordinate of the right hand side of the element,
%      YTOP is the Y coordinate of the top side of the element.
%
%  Options:
%
%    OPTION = 1:
%
%      PHI = exp ( 5 * ( dUdX**2 + dUdY**2 ) )
%
%      G ( U, LAMBDA ) = - 5 * LAMBDA
%	
%    OPTION = 2:
%
%      Let S = ( dUdX**2 + dUdY**2 ),
%      SBAR = ( 40 * S - 13 ) / 7
%
%      if ( S <= 0.15 ) then
%        PHI = 1.0
%      else if ( 0.15 <= S <= 0.50 ) then
%        PHI = 5.5 + 4.5 * ( 3 * SBAR - SBAR**3 )
%      else if ( 0.50 <= S ) then
%        PHI = 10.0
%
%      G ( U, LAMBDA ) = - 10 * LAMBDA
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
%    Werner Rheinboldt,
%    On the Solution of Some Nonlinear Equations Arising in the
%    Application of Finite Element Methods,
%    in The Mathematics of Finite Elements and Applications II,
%    edited by John Whiteman,
%    Academic Press, London, 1976, pages 465-482,
%    LC: TA347.F5.M37.
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
  ngauss = 4;
  nshape = 4;
  nside = 5;

  fx(1:nvar-1) = 0.0;

  nelem = floor ( ( nside - 1 ) * ( nside - 1 ) );
  hside = 1.0 / ( nside - 1 );

  for ielem = 1 : nelem
%
%  From the element number IELEM, compute the indices of the four
%  corners, in the order SW, SE, NW, NE.
%
    irowm1 = floor ( ( ielem - 1 ) / ( nside - 1 ) );
    icol = ielem - irowm1 * ( nside - 1 );
    irow = irowm1 + 1;

    xmid = hside * ( 2 * icol - 1 ) / 2.0;
    ymid = hside * ( 2 * irow - 1 ) / 2.0;

    node(1) = irowm1 * nside + icol;
    node(2) = node(1) + 1;
    node(3) = node(1) + nside;
    node(4) = node(3) + 1;
%
%  Get the Gauss points for this element.
%
    [ wgauss, xgauss, ygauss ] = p11_gauss ( hside, xmid, ymid );
%
%  For each Gauss point in this element, evaluate the integrand.
%
    for jgauss = 1 : ngauss

      xval = xgauss(jgauss);
      yval = ygauss(jgauss);
%
%  Evaluate the shape functions PSI and their derivatives.
%
      [ psi, dpsidx, dpsidy ] = p11_shape ( hside, xmid, xval, ymid, yval );
%
%  Evaluate U and its derivatives.
%
      uval = 0.0;
      dudx = 0.0;
      dudy = 0.0;
      for i = 1 : nshape
        uval = uval + x(node(i)) * psi(i);
        dudx = dudx + x(node(i)) * dpsidx(i);
        dudy = dudy + x(node(i)) * dpsidy(i);
      end
%
%  Evaluate PHI ( DUDX, DUDY ).
%
      [ phi, phip ] = p11_phi ( dudx, dudy, option );
%
%  Evaluate G ( U, LAMBDA ).
%
      [ flam, flampl, flampu ] = p11_gul ( option, x(nvar) );
%
%  Compute the inner product of the equation with each shape function
%  and add to the appropriate function.
%
      for kshape = 1 : nshape

        nod = node(kshape);
        jrowm1 = floor ( ( nod - 1 ) / nside );
        jcol = nod - jrowm1 * nside;
        jrow = jrowm1 + 1;

        if ( jrow == 1 | jrow == nside | jcol == 1 | jcol == nside ) 

          fx(nod) = x(nod);

        else

          fx(nod) = fx(nod) + wgauss(jgauss) * hside * hside * ...
                  ( phi * ( dudx * dpsidx(kshape) + dudy * dpsidy(kshape) ) ...
                  + flam * psi(kshape) );

        end

      end

    end

  end

  return
end
