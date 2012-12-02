function value = c4_cos ( z )

%*****************************************************************************80
%
%% C4_COS evaluates the cosine of a C4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2011
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
%    Input, complex Z, the argument.
%
%    Output, complex VALUE, the cosine of Z.
%
  x = real ( z );
  y = imag ( z );

  cs = cos ( x );

  c4_cos = complex ( cs * cosh ( y ), - sin ( x ) * sinh ( y ) );

  return
end
