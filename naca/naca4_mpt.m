function [ m, p, t ] = naca4_mpt ( code )

%*****************************************************************************80
%
%% NACA4_MPT returns the parameters stored in a NACA 4 digit airfoil code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer CODE, the NACA4 code.
%    0 <= CODE <= 9999.
%
%    Output, real M, the maximum camber, as a percentage of the chord length.
%    0 <= M <= 1.0.
%
%    Output, real P, the relative distance of the occurrence of the maximum 
%    camber from the beginning of the chord.
%    0 <= P <= 1.0.
%
%    Output, real T, the maximum thickness relative to the chord length.
%    0 <= T <= 1.0.
%
  if ( code < 0 || 9999 < code )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NACA4_MPT - Fatal error!\n' );
    fprintf ( 1, '  CODE should be an integer between 0 and 9999.\n' );
    error ( 'NACA4_MPT - Fatal error!' );
  end

  m = floor ( code / 1000 );
  code = code - m * 1000;
  m = m / 100.0;

  p = floor ( code / 100 );
  code = code - p * 100;
  p = p / 10.0;

  t = code / 100.0;

  return
end
