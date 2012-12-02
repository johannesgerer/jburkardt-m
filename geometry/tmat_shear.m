function b = tmat_shear ( a, axis, s )

%*****************************************************************************80
%
%% TMAT_SHEAR applies a shear to the geometric transformation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics, Principles and Practice,
%    Addison Wesley, Second Edition, 1990.
%
%  Parameters:
%
%    Input, real A(4,4), the current geometric transformation
%    matrix.
%
%    Input, character ( len = 2 ) AXIS, is 'XY', 'XZ', 'YX', 'YZ', 'ZX' or 'ZY',
%    specifying the shear equation:
%
%      XY:  x' = x + s * y;
%      XZ:  x' = x + s * z;
%      YX:  y' = y + s * x;
%      YZ:  y' = y + s * z;
%      ZX:  z' = z + s * x;
%      ZY:  z' = z + s * y.
%
%    Input, real S, the shear coefficient.
%
%    Output, real B(4,4), the modified geometric transformation
%    matrix.  A and B may share the same memory.
%
  c = tmat_init ( );

  if ( axis == 'XY' | axis == 'xy' )
    c(1,2) = s;
  elseif ( axis == 'XZ' | axis == 'xz' )
    c(1,3) = s;
  elseif ( axis == 'YX' | axis == 'yx' )
    c(2,1) = s;
  elseif ( axis == 'YZ' | axis == 'yz' )
    c(2,3) = s;
  elseif ( axis == 'ZX' | axis == 'zx' )
    c(3,1) = s;
  elseif ( axis == 'ZY' | axis == 'zy' )
    c(3,2) = s;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TMAT_SHEAR - Fatal error!\n' );
    fprintf ( 1, '  Illegal shear axis: %s\n', axis );
    fprintf ( 1, '  Legal choices are XY, XZ, YX, YZ, ZX, or ZY.\n' );
    error ( 'TMAT_SHEAR - Fatal error!' );
  end

  b(1:4,1:4) = c(1:4,1:4) * a(1:4,1:4);

  return
end
