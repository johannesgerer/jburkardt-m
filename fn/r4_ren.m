function value = r4_ren ( )

%*****************************************************************************80
%
%% R4_REN is a simple random number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Malcolm Pike, David Hill,
%    Algorithm 266:
%    Pseudo-Random Numbers,
%    Communications of the ACM,
%    Volume 8, Number 10, October 1965, page 605.
%
%  Parameters:
%
%    Output, real VALUE, the random value.
%
  persistent iy

  if ( isempty ( iy ) )
    iy = 100001;
  end

  iy = iy * 125;
  iy = iy - floor ( iy / 2796203 ) * 2796203;
  r4_ren = iy / 2796203.0;

  return
end
