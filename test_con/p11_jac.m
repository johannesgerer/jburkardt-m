function jac = p11_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P11_JAC evaluates the jacobian for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  ngauss = 4;
  nshape = 4;
  nside = 5;

  nelem = ( nside - 1 ) * ( nside - 1 );
  hside = 1.0 / ( nside - 1 );

  for ielem = 1 : nelem
%
%  From element number, compute 4 node numbers
%  in the order sw, se, nw, ne.
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
%  Get the Gauss quadrature points for this element.
%
    [ wgauss, xgauss, ygauss ] = p11_gauss ( hside, xmid, ymid );
%
%  At each Gauss point in this element, evaluate the integrand.
%
    for jgauss = 1 : ngauss

      xval = xgauss(jgauss);
      yval = ygauss(jgauss);
%
%  Evaluate the shape functions.
%
      [ psi, dpsidx, dpsidy ] = p11_shape (  hside, xmid, xval, ymid, yval );
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
%  Compute inner product of equation with each shape function
%  and add to appropriate function.
%
      for kshape = 1 : nshape

        nod = node(kshape);
        jrowm1 = floor ( ( nod - 1 ) / nside );
        jcol = nod - jrowm1 * nside;
        jrow = jrowm1 + 1;

        if ( jrow == 1 | jrow == nside | jcol == 1 | jcol == nside ) 

          jac(nod,nod) = 1.0;

        else

          for lshape = 1 : nshape

            nod2 = node(lshape);

            term1 = phi * dpsidx(lshape) + 2.0 * phip * ...
              ( dudx * dudx * dpsidx(lshape) + dudx * dudy * dpsidy(lshape) );

            term2 = phi * dpsidy(lshape) + 2.0 * phip * ...
              ( dudy * dudx * dpsidx(lshape) + dudy * dudy * dpsidy(lshape) );

            jac(nod,nod2) = jac(nod,nod2) + wgauss(jgauss) * hside * hside * ...
              ( term1 * dpsidx(kshape) + term2 * dpsidy(kshape) ...
              + flampu * psi(lshape) * psi(kshape) );

          end

          jac(nod,nvar) = jac(nod,nvar) + wgauss(jgauss) * hside * hside * ...
            flampl * psi(kshape);

        end

      end

    end

  end

  return
end
