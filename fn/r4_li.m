function value = r4_li ( x )

%*****************************************************************************80
%
%% R4_LI evaluates the logarithmic integral for an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
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
%    Output, real VALUE, the logarithmic integral evaluated at X.
%
  persistent sqeps

  if ( isempty ( sqeps ) )
    sqeps = sqrt ( r4_mach ( 3 ) );
  end

  if ( x < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LI - Fatal error!\n' );
    fprintf ( 1, '  Function undefined for X <= 0.\n' );
    error ( 'R4_LI - Fatal error!' )
  end

  if ( x == 0.0 )
    value = 0.0;
    return
  end

  if ( x == 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LI - Fatal error!\n' );
    fprintf ( 1, '  Function undefined for X = 1.\n' );
    error ( 'R4_LI - Fatal error!' )
  end

  if ( abs ( 1.0 - x ) < sqeps )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LI - Warning!\n' );
    fprintf ( 1, '  Answer less than half precision.\n' );
    fprintf ( 1, '  X is too close to 1.\n' );
  end

  value = r4_ei ( log ( x ) );

  return
end
