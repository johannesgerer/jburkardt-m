function value = r4_cos_deg ( x )

%*****************************************************************************80
%
%% R4_COS_DEG evaluates the cosine of an R4 argument in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2011
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
%    Input, real X, the argument in degrees.
%
%    Output, real VALUE, the cosine of X.
%
  raddeg = 0.017453292519943296;

  value = cos ( raddeg * x );

  if ( mod ( x, 90.0 ) == 0.0 )

    n = floor ( abs ( x ) / 90.0 + 0.5 );
    n = mod ( n, 2 );

    if ( n == 1 )
      value = 0.0;
    elseif ( value < 0.0 )
      value = - 1.0;
    else
      value = + 1.0;
    end

  end

  return
end
