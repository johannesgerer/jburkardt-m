function value = crude ( xx, nb )

%*****************************************************************************80
%
%% CRUDE returns a crude approximation for the W function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Andrew Barry, S. J. Barry, 
%    Patricia Culligan-Hensley.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andrew Barry, S. J. Barry, Patricia Culligan-Hensley,
%    Algorithm 743: WAPR - A Fortran routine for calculating real 
%    values of the W-function,
%    ACM Transactions on Mathematical Software,
%    Volume 21, Number 2, June 1995, pages 172-181.
%
%  Parameters:
%
%    Input, real XX, the argument.
%
%    Input, integer NB, indicates the desired branch.
%    * 0, the upper branch;
%    * nonzero, the lower branch.
%
%    Output, real VALUE, the crude approximation to W at XX.
%
  value = 0.0;

  em = - exp ( -1.0 );
  em9 = - exp ( -9.0 );
  c13 = 1.0 / 3.0;
  em2 = 2.0 / em;
  s2 = sqrt ( 2.0 );
  s21 = 2.0 * s2 - 3.0;
  s22 = 4.0 - 3.0 * s2;
  s23 = s2 - 2.0;
%
%  Crude Wp.
%
  if ( nb == 0 )

    if ( xx <= 20.0 )
      reta = s2 * sqrt ( 1.0 - xx / em );
      an2 = 4.612634277343749 * sqrt ( sqrt ( reta + 1.09556884765625 ) );
      value = reta / ( 1.0 + reta / ( 3.0 ...
        + ( s21 * an2 + s22 ) * reta / ( s23 * ( an2 + reta )))) - 1.0;
    else
      zl = log ( xx );
      value = log ( xx / log ( xx ...
        / zl ^ exp ( -1.124491989777808 / ...
        ( 0.4225028202459761 + zl ))));
    end

  else
%
%  Crude Wm.
%
    if ( xx <= em9 )
      zl = log ( -xx );
      t = -1.0 - zl;
      ts = sqrt ( t );
      value = zl - ( 2.0 * ts ) / ( s2 + ( c13 - t ...
        / ( 270.0 + ts * 127.0471381349219 ) ) * ts );
    else
      zl = log ( -xx );
      eta = 2.0 - em2 * xx;
      value = log ( xx / log ( - xx / ( ( 1.0 ...
        - 0.5043921323068457 * ( zl + 1.0 ) ) ...
        * ( sqrt ( eta ) + eta / 3.0 ) + 1.0 ) ) );
     end

  end

  return
end
