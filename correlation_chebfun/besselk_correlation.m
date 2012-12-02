function K = besselk_correlation ( s, t )

  K = ones ( size ( s ) );

  i = find ( s ~= t );
  K(i) = abs ( s(i) - t(i) ) .* besselk ( 1, abs ( s(i) - t(i) ) );

  return
end
