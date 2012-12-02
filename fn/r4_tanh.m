function value = r4_tanh ( x )

%*****************************************************************************80
%
%% R4_TANH evaluates the hyperbolic tangent of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the hyperbolic tangent of X.
%
  persistent nterms
  persistent sqeps
  persistent tanhcs
  persistent xmax

  if ( isempty ( nterms ) )
    tanhcs = [ ...
     -0.25828756643634710E+00, ...
     -0.11836106330053497E+00, ...
     +0.009869442648006398E+00, ...
     -0.000835798662344582E+00, ...
     +0.000070904321198943E+00, ...
     -0.000006016424318120E+00, ...
     +0.000000510524190800E+00, ...
     -0.000000043320729077E+00, ...
     +0.000000003675999055E+00, ...
     -0.000000000311928496E+00, ...
     +0.000000000026468828E+00, ...
     -0.000000000002246023E+00, ...
     +0.000000000000190587E+00, ...
     -0.000000000000016172E+00, ...
     +0.000000000000001372E+00, ...
     -0.000000000000000116E+00, ...
     +0.000000000000000009E+00 ]';
    nterms = r4_inits ( tanhcs, 17, 0.1 * r4_mach ( 3 ) );
    sqeps = sqrt ( 3.0 * r4_mach ( 3 ) );
    xmax = - 0.5 * log ( r4_mach ( 3 ) );
  end

  y = abs ( x );

  if ( y <= sqeps )

    value = x;

  elseif ( y <= 1.0 )

    value = x * ( 1.0 + r4_csevl ( 2.0 * x * x - 1.0, tanhcs, nterms ) );

  elseif ( y <= xmax )

    y = exp ( y );
    value = ( y - 1.0 / y ) / ( y + 1.0 / y );
    if ( x < 0.0 )
      value = - value;
    end

  else

    if ( x < 0.0 )
      value = - 1.0;
    else
      value = + 1.0;
    end

  end

  return
end
