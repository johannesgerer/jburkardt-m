function value = r4_psi ( x )

%*****************************************************************************80
%
%% R4_PSI evaluates the psi function of an R4 argument.
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
%    Output, real VALUE, the psi function of X.
%
  persistent apsics
  persistent dxrel
  persistent ntapsi
  persistent ntpsi
  persistent psics
  persistent xbig

  if ( isempty ( ntpsi ) )

    apsics = [ ...
     -0.0204749044678185E+00, ...
     -0.0101801271534859E+00, ...
      0.0000559718725387E+00, ...
     -0.0000012917176570E+00, ...
      0.0000000572858606E+00, ...
     -0.0000000038213539E+00, ...
      0.0000000003397434E+00, ...
     -0.0000000000374838E+00, ...
      0.0000000000048990E+00, ...
     -0.0000000000007344E+00, ...
      0.0000000000001233E+00, ...
     -0.0000000000000228E+00, ...
      0.0000000000000045E+00, ...
     -0.0000000000000009E+00, ...
      0.0000000000000002E+00, ...
     -0.0000000000000000E+00 ]';
    psics = [ ...
     -0.038057080835217922E+00, ...
      0.49141539302938713E+00, ...
     -0.056815747821244730E+00, ...
      0.008357821225914313E+00, ...
     -0.001333232857994342E+00, ...
      0.000220313287069308E+00, ...
     -0.000037040238178456E+00, ...
      0.000006283793654854E+00, ...
     -0.000001071263908506E+00, ...
      0.000000183128394654E+00, ...
     -0.000000031353509361E+00, ...
      0.000000005372808776E+00, ...
     -0.000000000921168141E+00, ...
      0.000000000157981265E+00, ...
     -0.000000000027098646E+00, ...
      0.000000000004648722E+00, ...
     -0.000000000000797527E+00, ...
      0.000000000000136827E+00, ...
     -0.000000000000023475E+00, ...
      0.000000000000004027E+00, ...
     -0.000000000000000691E+00, ...
      0.000000000000000118E+00, ...
     -0.000000000000000020E+00 ]';

    ntpsi = r4_inits ( psics, 23, 0.1 * r4_mach ( 3 ) );
    ntapsi = r4_inits ( apsics, 16, 0.1 * r4_mach ( 3 ) );
    xbig = 1.0 / sqrt ( r4_mach ( 3 ) );
    dxrel = sqrt ( r4_mach ( 4 ) );

  end

  y = abs ( x );

  if ( y < 2.0 )

    n = r4_aint ( x );
    if ( x < 0.0 )
      n = n - 1;
    end
    y = x - n;
    n = n - 1;
    value = r4_csevl ( 2.0 * y - 1.0, psics, ntpsi );

    if ( n == 0 )
      return
    end

    n = - n;

    if ( x == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_PSI - Fatal error!\n' );
      fprintf ( 1, '  X is zero.\n' );
      error ( 'R4_PSI - Fatal error!' )
    end

    if ( x < 0.0 && x + n - 2 == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_PSI - Fatal error!\n' );
      fprintf ( 1, '  X is a negative integer.\n' );
      error ( 'R4_PSI - Fatal error!' )
    end

    if ( x < - 0.5 && abs ( ( x - r4_aint ( x - 0.5 ) ) / x ) < dxrel )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_PSI - Warning!\n' );
      fprintf ( 1, '  Answer is less than half precision\n' );
      fprintf ( 1, '  because X is near a negative integer.\n' );
    end

    for i = 1 : n
      value = value - 1.0 / ( x + i - 1 );
    end

  else

    if ( y < xbig )
      aux = r4_csevl ( 8.0 / y / y - 1.0, apsics, ntapsi );
    else
      aux = 0.0;
    end

    if ( x < 0.0 )

      value = log ( abs ( x ) ) - 0.5 / x + aux ...
        - pi * r4_cot ( pi * x );

    elseif ( 0.0 < x )

      value = log ( x ) - 0.5 / x + aux;

    end

  end

  return
end
