function value = r8_besj0 ( x )

%*****************************************************************************80
%
%% R8_BESJ0 evaluates the Bessel function J of order 0 of an R8 argument.
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
%    Input, real X, the argument.
%
%    Output, real VALUE, the Bessel function J of order 0 of X.
%
  persistent bj0cs
  persistent ntj0
  persistent xsml

  if ( isempty ( ntj0 ) )

      bj0cs = [ ...
      +0.10025416196893913701073127264074, ...
      -0.66522300776440513177678757831124, ...
      +0.24898370349828131370460468726680, ...
      -0.33252723170035769653884341503854E-01, ...
      +0.23114179304694015462904924117729E-02, ...
      -0.99112774199508092339048519336549E-04, ...
      +0.28916708643998808884733903747078E-05, ...
      -0.61210858663032635057818407481516E-07, ...
      +0.98386507938567841324768748636415E-09, ...
      -0.12423551597301765145515897006836E-10, ...
      +0.12654336302559045797915827210363E-12, ...
      -0.10619456495287244546914817512959E-14, ...
      +0.74706210758024567437098915584000E-17, ...
      -0.44697032274412780547627007999999E-19, ...
      +0.23024281584337436200523093333333E-21, ...
      -0.10319144794166698148522666666666E-23, ...
      +0.40608178274873322700800000000000E-26, ...
      -0.14143836005240913919999999999999E-28, ...
      +0.43910905496698880000000000000000E-31 ]';

    ntj0 = r8_inits ( bj0cs, 19, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( 4.0 * r8_mach ( 3 ) );

  end

  y = abs ( x );

  if ( y <= xsml )
    value = 1.0;
  elseif ( y <= 4.0 )
    value = r8_csevl ( 0.125 * y * y - 1.0, bj0cs, ntj0 );
  else
    [ ampl, theta ] = r8_b0mp ( y );
    value = ampl * cos ( theta );
  end

  return
end
