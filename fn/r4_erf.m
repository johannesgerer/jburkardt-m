function value = r4_erf ( x )

%*****************************************************************************80
%
%% R4_ERF evaluates the error function of an R4 argument.
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
%    Input, real X, the argument.
%
%    Output, real VALUE, the error function of X.
%
  persistent erfcs
  persistent nterf
  persistent sqeps
  persistent sqrtpi
  persistent xbig

  sqrtpi = 1.7724538509055160;

  if ( isempty ( nterf ) )

    erfcs = [ ...
      -0.049046121234691808, ...
      -0.14226120510371364, ...
       0.010035582187599796, ...
      -0.000576876469976748, ...
       0.000027419931252196, ...
      -0.000001104317550734, ...
       0.000000038488755420, ...
      -0.000000001180858253, ...
       0.000000000032334215, ...
      -0.000000000000799101, ...
       0.000000000000017990, ...
      -0.000000000000000371, ...
       0.000000000000000007 ]';

    nterf = r4_inits ( erfcs, 13, 0.1 * r4_mach ( 3 ) );
    xbig = sqrt ( - log ( sqrtpi * r4_mach ( 3 ) ) );
    sqeps = sqrt ( 2.0 * r4_mach ( 3 ) );

  end

  y = abs ( x );

  if ( y <= sqeps )
    value = 2.0 * x / sqrtpi;
  elseif ( y <= 1.0 )
    value = x * ( 1.0 + r4_csevl ( 2.0 * x * x - 1.0, erfcs, nterf ) );
  elseif ( y <= xbig )
    value = 1.0 - r4_erfc ( y );
    if ( x < 0.0 )
      value = - value;
    end
  else
    value = 1.0;
    if ( x < 0.0 )
      value = - value;
    end
  end

  return
end
