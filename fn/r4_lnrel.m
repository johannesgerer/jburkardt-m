function value = r4_lnrel ( x )

%*****************************************************************************80
%
%% R4_LNREL evaluates log ( 1 + X ) for an R4 argument.
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
%    Output, real VALUE, the value of LOG ( 1 + X ).
%
  persistent alnrcs
  persistent nlnrel
  persistent xmin

  if ( isempty ( nlnrel ) )

    alnrcs = [ ...
      1.0378693562743770E+00, ...
     -0.13364301504908918E+00, ...
      0.019408249135520563E+00, ...
     -0.003010755112753577E+00, ...
      0.000486946147971548E+00, ...
     -0.000081054881893175E+00, ...
      0.000013778847799559E+00, ...
     -0.000002380221089435E+00, ...
      0.000000416404162138E+00, ...
     -0.000000073595828378E+00, ...
      0.000000013117611876E+00, ...
     -0.000000002354670931E+00, ...
      0.000000000425227732E+00, ...
     -0.000000000077190894E+00, ...
      0.000000000014075746E+00, ...
     -0.000000000002576907E+00, ...
      0.000000000000473424E+00, ...
     -0.000000000000087249E+00, ...
      0.000000000000016124E+00, ...
     -0.000000000000002987E+00, ...
      0.000000000000000554E+00, ...
     -0.000000000000000103E+00, ...
      0.000000000000000019E+00 ]';

    nlnrel = r4_inits ( alnrcs, 23, 0.1 * r4_mach ( 3 ) );
    xmin = - 1.0 + sqrt ( r4_mach ( 4 ) );

  end

  if ( x <= - 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LNREL - Fatal error!\n' );
    fprintf ( 1, '  X <= -1.\n' );
    error ( 'R4_LNREL - Fatal error!' )
  elseif ( x < xmin )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LNREL - Warning!\n' );
    fprintf ( 1, '  Result is less than half precision.\n' );
    fprintf ( 1, '  X is too close to - 1.\n' );
  end

  if ( abs ( x ) <= 0.375 )
    value = x * ( 1.0 - x * r4_csevl ( x / 0.375, alnrcs, nlnrel ) );
  else
    value = log ( 1.0 + x );
  end

  return
end
