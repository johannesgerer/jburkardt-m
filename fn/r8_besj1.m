function value = r8_besj1 ( x )

%*****************************************************************************80
%
%% R8_BESJ1 evaluates the Bessel function J of order 1 of an R8 argument.
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
%    Output, real VALUE, the Bessel function J of order 1 of X.
%
  persistent bj1cs
  persistent ntj1
  persistent xmin
  persistent xsml

  if ( isempty ( ntj1 ) )

    bj1cs = [ ...
      -0.117261415133327865606240574524003, ...
      -0.253615218307906395623030884554698, ...
      +0.501270809844695685053656363203743E-01, ...
      -0.463151480962508191842619728789772E-02, ...
      +0.247996229415914024539124064592364E-03, ...
      -0.867894868627882584521246435176416E-05, ...
      +0.214293917143793691502766250991292E-06, ...
      -0.393609307918317979229322764073061E-08, ...
      +0.559118231794688004018248059864032E-10, ...
      -0.632761640466139302477695274014880E-12, ...
      +0.584099161085724700326945563268266E-14, ...
      -0.448253381870125819039135059199999E-16, ...
      +0.290538449262502466306018688000000E-18, ...
      -0.161173219784144165412118186666666E-20, ...
      +0.773947881939274637298346666666666E-23, ...
      -0.324869378211199841143466666666666E-25, ...
      +0.120223767722741022720000000000000E-27, ...
      -0.395201221265134933333333333333333E-30, ...
      +0.116167808226645333333333333333333E-32 ]';

    ntj1 = r8_inits ( bj1cs, 19, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( 4.0 * r8_mach ( 3 ) );
    xmin = 2.0 * r8_mach ( 1 );

  end

  y = abs ( x );

  if ( y <= xmin )
    value = 0.0;
  elseif ( y <= xsml )
    value = 0.5 * x;
  elseif ( y <= 4.0 )
    value = x * ( 0.25 + r8_csevl ( 0.125 * y * y - 1.0, bj1cs, ntj1 ) );
  else
    [ ampl, theta ] = r8_b1mp ( y );
    if ( x < 0.0 )
      value = - ampl * cos ( theta );
    else
      value = + ampl * cos ( theta );
    end
  end

  return
end
