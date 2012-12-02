function value = r8_cbrt ( x )

%*****************************************************************************80
%
%% R8_CBRT computes the cube root of an R8.
%
%  Discussion:
%
%    The approximation is a generalized Chebyshev series converted
%    to polynomial form.  The approximation is nearly best in the
%    sense of relative error with 4.085 digits accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
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
%    Input, real X, the number whose square root is desired.
%
%    Output, real VALUE, the cube root of X.
%
  persistent cbrt2
  persistent niter

  if ( isempty ( niter ) )

    cbrt2 = [ ...
      0.62996052494743658238360530363911, ...
      0.79370052598409973737585281963615, ...
      1.0, ...
      1.25992104989487316476721060727823, ...
      1.58740105196819947475170563927231 ]';

    niter = r8_aint ( 1.443 * log ( - 0.106 ...
      * log ( 0.1 * r8_mach ( 3 ) ) ) + 1.0 );

  end

  value = 0.0;

  if ( x ~= 0.0 )

    [ y, n ] = r8_upak ( abs ( x ) );
    ixpnt = floor ( n / 3 );
    irem = n - 3 * ixpnt + 3;

    value = 0.439581 + y * ( ...
            0.928549 + y * ( ...
          - 0.512653 + y * ...
            0.144586 ) );

    for iter = 1 : niter
      vsq = value * value;
      value = value + ( y - value * vsq ) / ( 3.0 * vsq );
    end

    if ( x < 0.0 )
      value = - abs ( value );
    else
      value = + abs ( value );
    end

    value = r8_pak ( cbrt2(irem) * value, ixpnt );

  end

  return
end
