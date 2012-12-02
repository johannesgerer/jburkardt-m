function value = r4_bi ( x )

%*****************************************************************************80
%
%% R4_BI evaluates the Airy function Bi of an R4 argument.
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
%    Output, real VALUE, the Airy function Bi of X.
%
  persistent bif2cs
  persistent bifcs
  persistent big2cs
  persistent bigcs
  persistent nbif
  persistent nbif2
  persistent nbig
  persistent nbig2
  persistent x3sml
  persistent xmax

  if ( isempty ( nbif ) )

    bif2cs = [ ...
      0.09984572693816041E+00, ...
      0.478624977863005538E+00, ...
      0.0251552119604330118E+00, ...
      0.0005820693885232645E+00, ...
      0.0000074997659644377E+00, ...
      0.0000000613460287034E+00, ...
      0.0000000003462753885E+00, ...
      0.0000000000014288910E+00, ...
      0.0000000000000044962E+00, ...
      0.0000000000000000111E+00 ]';
    bifcs = [ ...
     -0.01673021647198664948E+00, ...
      0.1025233583424944561E+00, ...
      0.00170830925073815165E+00, ...
      0.00001186254546774468E+00, ...
      0.00000004493290701779E+00, ...
      0.00000000010698207143E+00, ...
      0.00000000000017480643E+00, ...
      0.00000000000000020810E+00, ...
      0.00000000000000000018E+00 ]';
    big2cs = [ ...
      0.033305662145514340E+00, ...
      0.161309215123197068E+00, ...
      0.0063190073096134286E+00, ...
      0.0001187904568162517E+00, ...
      0.0000013045345886200E+00, ...
      0.0000000093741259955E+00, ...
      0.0000000000474580188E+00, ...
      0.0000000000001783107E+00, ...
      0.0000000000000005167E+00, ...
      0.0000000000000000011E+00 ]';
    bigcs = [ ...
      0.02246622324857452E+00, ...
      0.03736477545301955E+00, ...
      0.00044476218957212E+00, ...
      0.00000247080756363E+00, ...
      0.00000000791913533E+00, ...
      0.00000000001649807E+00, ...
      0.00000000000002411E+00, ...
      0.00000000000000002E+00 ]';

    eta = 0.1 * r4_mach ( 3 );
    nbif = r4_inits ( bifcs, 9, eta );
    nbig = r4_inits ( bigcs, 8, eta );
    nbif2 = r4_inits ( bif2cs, 10, eta );
    nbig2 = r4_inits ( big2cs, 10, eta );
    x3sml = eta^0.3333;
    xmax = ( 1.5 * log ( r4_mach ( 2 ) ) )^0.6666;

  end

  if ( x <= - 1.0 )

    [ xm, theta ] = r4_aimp ( x );

    value = xm * sin ( theta );

  elseif ( abs ( x ) <= x3sml )

    z = 0.0;

    value = 0.625 + r4_csevl ( z, bifcs, nbif ) ...
      + x * ( 0.4375 + r4_csevl ( z, bigcs, nbig ) );

  elseif ( x <= 1.0 )

    z = x * x * x;

    value = 0.625 + r4_csevl ( z, bifcs, nbif ) ...
      + x * ( 0.4375 + r4_csevl ( z, bigcs, nbig ) );

  elseif ( x <= 2.0 )

    z = ( 2.0 * x * x * x - 9.0 ) / 7.0;

    value = 1.125 + r4_csevl ( z, bif2cs, nbif2 ) ...
      + x * ( 0.625 + r4_csevl ( z, big2cs, nbig2 ) );

  else

    value = r4_bie ( x ) * exp ( 2.0 * x * sqrt ( x ) / 3.0 );

  end

  return
end
