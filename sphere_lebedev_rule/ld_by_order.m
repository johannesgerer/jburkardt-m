function [ x, y, z, w ] = ld_by_order ( order )

%*****************************************************************************80
%
%% LD_BY_ORDER returns a Lebedev angular grid given its order.
%
%  Discussion:
%
%    Only a certain set of such rules are available through this function.
%
%  Modified:
%
%    13 September 2010
%
%  Author:
%
%    Dmitri Laikov
%
%  Reference:
%
%    Vyacheslav Lebedev, Dmitri Laikov,
%    A quadrature formula for the sphere of the 131st
%    algebraic order of accuracy,
%    Russian Academy of Sciences Doklady Mathematics,
%    Volume 59, Number 3, 1999, pages 477-481.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real X(ORDER), Y(ORDER), Z(ORDER), W(ORDER), 
%    the coordinates and weights of the points.
%
  if ( order == 6 )
    [ x, y, z, w ] = ld0006 ( );
  elseif ( order == 14 )
    [ x, y, z, w ] = ld0014 ( );
  elseif ( order == 26 )
    [ x, y, z, w ] = ld0026 ( );
  elseif ( order == 38 )
    [ x, y, z, w ] = ld0038 ( );
  elseif ( order == 50 )
    [ x, y, z, w ] = ld0050 ( );
  elseif ( order == 74 )
    [ x, y, z, w ] = ld0074 ( );
  elseif ( order == 86 )
    [ x, y, z, w ] = ld0086 ( );
  elseif ( order == 110 )
    [ x, y, z, w ] = ld0110 ( );
  elseif ( order == 146 )
    [ x, y, z, w ] = ld0146 ( );
  elseif ( order == 170 )
    [ x, y, z, w ] = ld0170 ( );
  elseif ( order == 194 )
    [ x, y, z, w ] = ld0194 ( );
  elseif ( order == 230 )
    [ x, y, z, w ] = ld0230 ( );
  elseif ( order == 266 )
    [ x, y, z, w ] = ld0266 ( );
  elseif ( order == 302 )
    [ x, y, z, w ] = ld0302 ( );
  elseif ( order == 350 )
    [ x, y, z, w ] = ld0350 ( );
  elseif ( order == 434 )
    [ x, y, z, w ] = ld0434 ( );
  elseif ( order == 590 )
    [ x, y, z, w ] = ld0590 ( );
  elseif ( order == 770 )
    [ x, y, z, w ] = ld0770 ( );
  elseif ( order == 974 )
     [ x, y, z, w ] = ld0974 ( );
  elseif ( order == 1202 )
    [ x, y, z, w ] = ld1202 ( );
  elseif ( order == 1454 )
    [ x, y, z, w ] = ld1454 ( );
  elseif ( order == 1730 )
    [ x, y, z, w ] = ld1730 ( );
  elseif ( order == 2030 )
    [ x, y, z, w ] = ld2030 ( );
  elseif ( order == 2354 )
    [ x, y, z, w ] = ld2354 ( );
  elseif ( order == 2702 )
    [ x, y, z, w ] = ld2702 ( );
  elseif ( order == 3074 )
    [ x, y, z, w ] = ld3074 ( );
  elseif ( order == 3470 )
    [ x, y, z, w ] = ld3470 ( );
  elseif ( order == 3890 )
    [ x, y, z, w ] = ld3890 ( );
  elseif ( order == 4334 )
    [ x, y, z, w ] = ld4334 ( );
  elseif ( order == 4802 )
    [ x, y, z, w ] = ld4802 ( );
  elseif ( order == 5294 )
    [ x, y, z, w ] = ld5294 ( );
  elseif ( order == 5810 )
    [ x, y, z, w ] = ld5810 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LD_BY_ORDER - Fatal error!\n' );
    fprintf ( 1, '  Unexpected value of ORDER.\n' );
    error ( 'LD_BY_ORDER - Fatal error!' );
  end

  return
end