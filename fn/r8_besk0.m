function value = r8_besk0 ( x )

%*****************************************************************************80
%
%% R8_BESK0 evaluates the Bessel function K of order 0 of an R8 argument.
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
%    Output, real VALUE, the Bessel function K of order 0 of X.
%
  persistent bk0cs
  persistent ntk0
  persistent xmax
  persistent xsml

  if ( isempty ( ntk0 ) )

    bk0cs = [ ...
      -0.353273932339027687201140060063153E-01, ...
      +0.344289899924628486886344927529213, ...
      +0.359799365153615016265721303687231E-01, ...
      +0.126461541144692592338479508673447E-02, ...
      +0.228621210311945178608269830297585E-04, ...
      +0.253479107902614945730790013428354E-06, ...
      +0.190451637722020885897214059381366E-08, ...
      +0.103496952576336245851008317853089E-10, ...
      +0.425981614279108257652445327170133E-13, ...
      +0.137446543588075089694238325440000E-15, ...
      +0.357089652850837359099688597333333E-18, ...
      +0.763164366011643737667498666666666E-21, ...
      +0.136542498844078185908053333333333E-23, ...
      +0.207527526690666808319999999999999E-26, ...
      +0.271281421807298560000000000000000E-29, ...
      +0.308259388791466666666666666666666E-32 ]';

    ntk0 = r8_inits (bk0cs, 16, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( 4.0 * r8_mach ( 3 ) );
    xmax = - log ( r8_mach ( 1 ) );
    xmax = xmax - 0.5 * xmax * log ( xmax ) / ( xmax + 0.5 );

  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESK0 = Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_BESK0 = Fatal error!' )
  elseif ( x <= xsml )
    y = 0.0;
    value = - log ( 0.5 * x ) * r8_besi0 ( x ) ...
      - 0.25 + r8_csevl ( 0.5 * y - 1.0, bk0cs, ntk0 );
  elseif ( x <= 2.0 )
    y = x * x;
    value = - log ( 0.5 * x ) * r8_besi0 ( x ) ...
      - 0.25 + r8_csevl ( 0.5 * y - 1.0, bk0cs, ntk0 );
  elseif ( x <= xmax )
    value = exp ( - x ) * r8_besk0e ( x );
  else
    value = 0.0;
  end

  return
end
