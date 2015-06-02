function [ value, en ] = wew_b ( x )

%*****************************************************************************80
%
%% WEW_B estimates Lambert's W function.
%
%  Discussion:
%
%    For a given X, this routine estimates the solution W of Lambert's 
%    equation:
%
%      X = W * EXP ( W )
%
%    This routine has lower accuracy than WEW_A.
%
%  Modified:
%
%    11 June 2014
%
%  Reference:
%
%    Fred Fritsch, R Shafer, W Crowley,
%    Algorithm 443: Solution of the transcendental equation w e^w = x,
%    Communications of the ACM,
%    October 1973, Volume 16, Number 2, pages 123-124.
%
%  Parameters:
%
%    Input, real X, the argument of W(X)
%
%    Output, real VALUE, the estimated value of W(X).
%
%    Output, real EN, the last relative correction to W(X).
%

  c1 = 4.0 / 3.0;
  c2 = 7.0 / 3.0;
  c3 = 5.0 / 6.0;
  c4 = 2.0 / 3.0;
%
%  Initial guess.
%
  f = log ( x );

  if ( x <= 0.7385 )
    wn = x .* ( 1.0 + c1 * x ) ./ ( 1.0 + x .* ( c2 + c3 * x ) );
  else
    wn = f - 24.0 * ( ( f + 2.0 ) .* f - 3.0 ) ...
      ./ ( ( 0.7 * f + 58.0 ) .* f + 127.0 );
  end
%
%  Iteration 1.
%
  zn = f - wn - log ( wn );
  temp = 1.0 + wn;
  y = 2.0 * temp * ( temp + c4 * zn ) - zn;
  en = zn * y / ( temp * ( y - zn ) );
  wn = wn * ( 1.0 + en );

  value = wn;

  return
end
