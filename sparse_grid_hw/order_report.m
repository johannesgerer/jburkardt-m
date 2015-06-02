function order_report ( )

%*****************************************************************************80
%
%% ORDER_REPORT reports on the order of each 1D family of rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ORDER_REPORT\n' );
  fprintf ( 1, '  For each family of rules, report:\n' );
  fprintf ( 1, '  L,  the level index,\n' );
  fprintf ( 1, '  RP, the required polynomial precision,\n' );
  fprintf ( 1, '  AP, the actual polynomial precision,\n' );
  fprintf ( 1, '  O,  the rule order (number of points).\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  GLO family\n' );
  fprintf ( 1, '  Gauss-Legendre Odd quadrature, uniform weight, [-1,+1]\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L  RP  AP   O\n' );
  fprintf ( 1, '\n' );

  for l = 1 : 25
    rp = 2 * l - 1;
    o = 2 * floor ( l / 2 ) + 1;
    ap = 2 * o - 1;
    fprintf ( 1, '  %2d  %2d  %2d  %2d\n', l, rp, ap, o );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  GQN family\n' );
  fprintf ( 1, '  Gauss quadrature, exponential weight, (-oo,+oo)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L  RP  AP   O\n' );
  fprintf ( 1, '\n' );

  for l = 1 : 25
    rp = 2 * l - 1;
    o = l;
    ap = 2 * o - 1;
    fprintf ( 1, '  %2d  %2d  %2d  %2d\n', l, rp, ap, o );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  GQU family\n' );
  fprintf ( 1, '  Gauss quadrature, unit weight, [0,1]\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L  RP  AP   O\n' );
  fprintf ( 1, '\n' );

  for l = 1 : 25
    rp = 2 * l - 1;
    o = l;
    ap = 2 * o - 1;
    fprintf ( 1, '  %2d  %2d  %2d  %2d\n', l, rp, ap, o );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  KPN family\n' );
  fprintf ( 1, '  Gauss-Kronrod-Patterson quadrature, exponential weight, (-oo,+oo)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L  RP  AP   O\n' );
  fprintf ( 1, '\n' );

  kpn_order = [ 1, 3, 9, 19, 35 ];

  k = 1;
  o = 1;
  ap = 1;

  for l = 1 : 25
    rp = 2 * l - 1;
    while ( ap < rp )
      if ( k == 5 )
        fprintf ( 1, '\n' );
        fprintf ( 1, '  No higher order rule is available!\n' );
        break
      end
      if ( rp < kpn_order(k+1) )
        o = rp;
        ap = rp;
      else
        k = k + 1;
        ap = 2 * kpn_order(k) - kpn_order(k-1);
        o = kpn_order(k);
      end
    end
    fprintf ( 1, '  %2d  %2d  %2d  %2d\n', l, rp, ap, o );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  KPU family\n' );
  fprintf ( 1, '  Gauss-Kronrod-Patterson quadrature, unit weight, [0,1]\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L  RP  AP   O\n' );
  fprintf ( 1, '\n' );

  for l = 1 : 25
    rp = 2 * l - 1;
    o = 1;
    ap = 1;
    while ( ap < rp )
      o = 2 * ( o + 1 ) - 1;
      ap = ( 3 * o + 1 ) / 2;
    end
    fprintf ( 1, '  %2d  %2d  %2d  %2d\n', l, rp, ap, o );
  end

  return
end
