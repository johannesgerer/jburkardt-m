function [ value, jsr ] = shr3 ( jsr )

%*****************************************************************************80
%
%% SHR3 evaluates the SHR3 generator for integers.
%
%  Discussion:
%
%    The input and output values are all unsigned 32 bit integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2008
%
%  Author:
%
%    Original C version by George Marsaglia, Wai Wan Tsang
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    George Marsaglia, Wai Wan Tsang,
%    The Ziggurat Method for Generating Random Variables,
%    Journal of Statistical Software,
%    Volume 5, Number 8, October 2000, seven pages.
%
%  Parameters:
%
%    Input, uint32 JSR, the seed.
%
%    Output, uint32 SHR3, the value of the SHR3 generator.
%
%    Output, uint32 JSR, the updated seed.
%
  jsr_input = uint32 ( jsr );

  jsr = uint32 ( bitxor ( jsr, uint32 ( bitshift ( jsr, + 13 ) ) ) );
  jsr = uint32 ( bitxor ( jsr, uint32 ( bitshift ( jsr, - 17 ) ) ) );
  jsr = uint32 ( bitxor ( jsr, uint32 ( bitshift ( jsr, +  5 ) ) ) );
%
%  We simply want to add JSR_INPUT and JSR and ignore the overflow digits.
%  But if we add two UINT32's and overflow, MATLAB sets the result to the
%  maximum 32 bit integer!
%
%  To avoid this, until I get smarter, we convert both UINT32's to doubles,
%  add them, subtract the maximum 32 bit integer + 1 (the overflow digit),
%  and convert back.  How ghastly.
%
  goof = double ( jsr_input ) + double ( jsr );
  if ( 4294967296 <= goof )
    goof = goof - 4294967296;
  end
  value = uint32 ( goof );

  return
end
