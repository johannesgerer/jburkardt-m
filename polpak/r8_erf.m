function erfx = r8_erf ( x )

%*****************************************************************************80
%
%% R8_ERF evaluates the error function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2007
%
%  Author:
%
%    W J Cody,
%    Mathematics and Computer Science Division,
%    Argonne National Laboratory,
%    Argonne, Illinois, 60439.
%
%  Reference:
%
%    W J Cody,
%    "Rational Chebyshev approximations for the error function",
%    Mathematics of Computation, 
%    1969, pages 631-638.
%
%  Parameters:
%
%    Input, real X, the argument of the error function.
%
%    Output, real ERFX, the value of the error function.
%
  a = [ ...
    3.16112374387056560E+00, ...
    1.13864154151050156E+02, ...
    3.77485237685302021E+02, ...
    3.20937758913846947E+03, ...
    1.85777706184603153E-01 ];
  b = [ ...
    2.36012909523441209E+01, ...
    2.44024637934444173E+02, ...
    1.28261652607737228E+03, ...
    2.84423683343917062E+03 ];
  c = [ ...
    5.64188496988670089E-01, ...
    8.88314979438837594E+00, ...
    6.61191906371416295E+01, ...
    2.98635138197400131E+02, ...
    8.81952221241769090E+02, ...
    1.71204761263407058E+03, ...
    2.05107837782607147E+03, ...
    1.23033935479799725E+03, ...
    2.15311535474403846E-08 ];
  d = [ ...
    1.57449261107098347E+01, ...
    1.17693950891312499E+02, ...
    5.37181101862009858E+02, ...
    1.62138957456669019E+03, ...
    3.29079923573345963E+03, ...
    4.36261909014324716E+03, ...
    3.43936767414372164E+03, ...
    1.23033935480374942E+03 ];
  p = [ ...
    3.05326634961232344E-01, ...
    3.60344899949804439E-01, ...
    1.25781726111229246E-01, ...
    1.60837851487422766E-02, ...
    6.58749161529837803E-04, ...
    1.63153871373020978E-02 ];
  q = [ ...
    2.56852019228982242E+00, ...
    1.87295284992346047E+00, ...
    5.27905102951428412E-01, ...
    6.05183413124413191E-02, ...
    2.33520497626869185E-03 ];
  sqrpi = 0.56418958354775628695E+00;
  thresh = 0.46875E+00;
  xbig = 26.543E+00;
  xsmall = 1.11E-16;
%
  xabs = abs ( x );
%
%  Evaluate ERF(X) for |X| <= 0.46875.
%
  if ( xabs <= thresh )

    if ( xsmall < xabs )
      xsq = xabs * xabs;
    else
      xsq = 0.0;
    end

    xnum = a(5) * xsq;
    xden = xsq;
    for i = 1 : 3
      xnum = ( xnum + a(i) ) * xsq;
      xden = ( xden + b(i) ) * xsq;
    end

    erfx = x * ( xnum + a(4) ) / ( xden + b(4) );
%
%  Evaluate ERFC(X) for 0.46875 <= |X| <= 4.0.
%
  elseif ( xabs <= 4.0 )

    xnum = c(9) * xabs;
    xden = xabs;
    for i = 1 : 7
      xnum = ( xnum + c(i) ) * xabs;
      xden = ( xden + d(i) ) * xabs;
    end

    erfx = ( xnum + c(8) ) / ( xden + d(8) );
    xsq = floor ( xabs * 16.0 ) / 16.0;
    del = ( xabs - xsq ) * ( xabs + xsq );
    erfx = exp ( - xsq * xsq ) * exp ( - del ) * erfx;

    erfx = ( 0.5 - erfx ) + 0.5;

    if ( x < 0.0 )
      erfx = -erfx;
    end
%
%  Evaluate ERFC(X) for 4.0 < |X|.
%
  else

    if ( xbig <= xabs )

      if ( 0.0 < x )
        erfx = 1.0;
      else
        erfx = -1.0;
      end

    else

      xsq = 1.0 / ( xabs * xabs );

      xnum = p(6) * xsq;
      xden = xsq;
      for i = 1 : 4
        xnum = ( xnum + p(i) ) * xsq;
        xden = ( xden + q(i) ) * xsq;
      end

      erfx = xsq * ( xnum + p(5) ) / ( xden + q(5) );
      erfx = ( sqrpi -  erfx ) / xabs;
      xsq = floor ( xabs * 16.0 ) / 16.0;
      del = ( xabs - xsq ) * ( xabs + xsq );
      erfx = exp ( - xsq * xsq ) * exp ( - del ) * erfx;

      erfx = ( 0.5 - erfx ) + 0.5;
      if ( x < 0.0 )
        erfx = -erfx;
      end

    end

  end

  return
end

