function K = correlation_brownian ( s, t )

%*****************************************************************************80
%
%% CORRELATION_BROWNIAN computes the Brownian correlation function.
%
  K = ones ( size ( s ) );
  i = find ( max ( s, t ) ~= 0.0 );
  K(i) = sqrt ( min ( s(i), t(i) ) ./ max ( s(i), t(i) ) );
  
  return
end
