function [ xmin, xmax ] = r8_gaml ( )

%*****************************************************************************80
%
%% R8_GAML evaluates bounds for an R8 argument of the gamma function.
%
%  Discussion:
%
%    This function calculates the minimum and maximum legal bounds
%    for X in the evaluation of GAMMA ( X ).
%
%    XMIN and XMAX are not the only bounds, but they are the only
%    non-trivial ones to calculate.
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
%    Output, real XMIN, XMAX, the bounds.
%
  alnsml = log ( r8_mach ( 1 ) );
  xmin = - alnsml;

  for i = 1 : 10

    xold = xmin;
    xln = log ( xmin );
    xmin = xmin - xmin * ( ( xmin + 0.5 ) * xln - xmin ...
      - 0.2258 + alnsml ) / ( xmin * xln + 0.5 );

    if ( abs ( xmin - xold ) < 0.005 )

      xmin = - xmin + 0.01;

      alnbig = log ( r8_mach ( 2 ) );
      xmax = alnbig;

      for j = 1 : 10

        xold = xmax;
        xln = log ( xmax );
        xmax = xmax - xmax * ( ( xmax - 0.5 ) * xln - xmax ...
          + 0.9189 - alnbig ) / ( xmax * xln - 0.5 );

        if ( abs ( xmax - xold ) < 0.005 )
          xmax = xmax - 0.01;
          xmin = max ( xmin, - xmax + 1.0 );
          return
        end

      end

      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_GAML - Fatal error!\n' );
      fprintf ( 1, '  Unable to find XMAX.\n' );
      error ( 'R8_GAML - Fatal error!' )

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_GAML - Fatal error!\n' );
  fprintf ( 1, '  Unable to find XMIN.\n' );

  error ( 'R8_GAML - Fatal error!' )
end
