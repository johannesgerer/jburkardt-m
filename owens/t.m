function value = t ( h, a )

%*****************************************************************************80
%
%% T computes Owen's T function for arbitrary H and A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    Original FORTRAN77 version by Mike Patefield, David Tandy.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Mike Patefield, David Tandy,
%    Fast and Accurate Calculation of Owen's T Function,
%    Journal of Statistical Software,
%    Volume 5, Number 5, 2000, pages 1-25.
%
%  Parameters:
%
%    Input, real H, A, the arguments.
%
%    Output, real VALUE, the value of Owen's T function.
%
  cut = 0.67;
  rroot2 = 0.70710678118654752440;

  absh = abs ( h );
  absa = abs ( a );
  ah = absa * absh;

  if ( absa <= 1.0 )

    value = tfun ( absh, absa, ah );

  elseif ( absh <= cut )

    value = 0.25 - znorm1 ( absh ) * znorm1 ( ah ) ...
      - tfun ( ah, 1.0 / absa, absh );

  else

    normh = znorm2 ( absh );
    normah = znorm2 ( ah );
    value = 0.5 * ( normh + normah ) - normh * normah ...
    - tfun ( ah, 1.0 / absa, absh );

  end

  if ( a < 0.0 )
    value = - value;
  end

  return
end
