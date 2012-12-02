function y = lcrg_evaluate ( a, b, c, x )

%*****************************************************************************80
%
%% LCRG_EVALUATE evaluates an LCRG, y = ( A * x + B ) mod C.
%
%  Discussion:
%
%    This routine cannot be recommended for production use.  Because we want
%    to do modular arithmetic, but the base is not a power of 2, we need to
%    use "double precision" integers to keep accuracy.
%
%    If we knew the base C, we could try to avoid overflow while not changing
%    precision.
%
%    If the base C was a power of 2, we could rely on the usual properties of
%    integer arithmetic on computers, in which overflow bits, which are always
%    ignored, don't actually matter.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the multiplier for the LCRG.
%
%    Input, integer B, the added value for the LCRG.
%
%    Input, integer C, the base for the modular arithmetic.
%    For 32 bit arithmetic, this is often 2^31 - 1, or 2147483647.  It is
%    required that 0 < C.
%
%    Input, integer X, the value to be processed.
%
%    Output, integer Y, the processed value.
%
  y = mod ( a * x + b, c );

  if ( y < 0 )
    y = y + c;
  end

  return
end
