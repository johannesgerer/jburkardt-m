function value = r8_exp ( x )

%*****************************************************************************80
%
%% R8_EXP evaluates the exponential of an R8 argument.
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
%    Output, real VALUE, the exponential of X.
%
  persistent aln216
  persistent expcs
  persistent nterms
  persistent twon16
  persistent xmax
  persistent xmin

  aln216 = +0.83120654223414517758794896030274E-01;

  if ( isempty ( nterms ) )

    expcs = [ ...
      +0.866569493314985712733404647266231E-01, ...
      +0.938494869299839561896336579701203E-03, ...
      +0.677603970998168264074353014653601E-05, ...
      +0.366931200393805927801891250687610E-07, ...
      +0.158959053617461844641928517821508E-09, ...
      +0.573859878630206601252990815262106E-12, ...
      +0.177574448591421511802306980226000E-14, ...
      +0.480799166842372422675950244533333E-17, ...
      +0.115716376881828572809260000000000E-19, ...
      +0.250650610255497719932458666666666E-22, ...
      +0.493571708140495828480000000000000E-25, ...
      +0.890929572740634240000000000000000E-28, ...
      +0.148448062907997866666666666666666E-30, ...
      +0.229678916630186666666666666666666E-33 ]';
    twon16 = [ ...
      +0.0, ...
      +0.44273782427413840321966478739929E-01, ...
      +0.90507732665257659207010655760707E-01, ...
      +0.13878863475669165370383028384151, ...
      +0.18920711500272106671749997056047, ...
      +0.24185781207348404859367746872659, ...
      +0.29683955465100966593375411779245, ...
      +0.35425554693689272829801474014070, ...
      +0.41421356237309504880168872420969, ...
      +0.47682614593949931138690748037404, ...
      +0.54221082540794082361229186209073, ...
      +0.61049033194925430817952066735740, ...
      +0.68179283050742908606225095246642, ...
      +0.75625216037329948311216061937531, ...
      +0.83400808640934246348708318958828, ...
      +0.91520656139714729387261127029583, ...
      +1.0 ]';

    nterms = r8_inits ( expcs, 14, 0.1 * r8_mach ( 3 ) );
    xmin = log ( r8_mach ( 1 ) ) + 0.01;
    xmax = log ( r8_mach ( 2 ) ) - 0.001;

  end

  if ( x < xmin )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_EXP - Warning!\n' );
    fprintf ( 1, '  X so small that exp(X) underflows.\n' );
    value = 0.0;

  elseif ( x <= xmax )

    xint = r8_aint ( x );;
    y = x - xint;

    y = 23.0 * y + x * aln216;
    n = r8_aint ( y );
    f = y - n;
    n = r8_aint ( 23.0 * xint + n );
    n16 = r8_aint ( n / 16 );
    if ( n < 0 )
      n16 = n16 - 1;
    end
    ndx = n - 16 * n16 + 1;

    value = 1.0 + ( twon16(ndx) + f * ( 1.0 + twon16(ndx) ) ...
      * r8_csevl ( f, expcs, nterms ) );

    value = r8_pak ( value, n16 );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_EXP - Fatal error!\n' );
    fprintf ( 1, '  X so large that exp(X) overflows.\n' );
    error ( 'R8_EXP - Fatal error!' )

  end

  return
end
