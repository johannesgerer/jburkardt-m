function [ kn, fn, wn ] = r4_nor_setup ( )

%*****************************************************************************80
%
%% R4_NOR_SETUP sets data needed by R4_NOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2008
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
%    Output, integer KN(128), data needed by R4_NOR.
%
%    Output, real FN(128), WN(128), data needed by R4_NOR.
%
  m1 = 2147483648.0;
  vn = 9.91256303526217E-03;

  dn = 3.442619855899;
  tn = 3.442619855899;

  q = vn / exp ( - 0.5 * dn * dn );
  kn(1) = floor ( ( dn / q ) * m1 );
  kn(2) = 0;

  wn(1) = q / m1;
  wn(128) = dn / m1;

  fn(1) = 1.0;
  fn(128) = exp ( - 0.5 * dn * dn );

  for i = 127 : -1 : 2
    dn = sqrt ( - 2.0 * log ( vn / dn + exp ( - 0.5 * dn * dn ) ) );
    kn(i+1) = floor ( ( dn / tn ) * m1 );
    tn = dn;
    fn(i) = exp ( - 0.5 * dn * dn );
    wn(i) = dn / m1;
  end

  return
end
